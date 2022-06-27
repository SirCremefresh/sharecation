import {
  Authenticated,
  CreateAuthenticationWithFirebaseRequest,
  CreateAuthenticationWithFirebaseResponse,
  CreateRoleBindingRequest,
  CreateRoleBindingResponse,
  DeleteRoleBindingRequest,
  DeleteRoleBindingResponse,
  GetRolesOfUserRequest,
  GetRolesOfUserResponse,
  RoleBinding,
  Roles,
} from '../../contracts/authentication/v1/authentication';
import {
  Person,
  UpsertPersonRequest,
  UpsertPersonResponse,
} from '../../contracts/authentication/v1/person';
import {
  GetPublicJwksResponse,
  PublicJwks,
} from '../../contracts/authentication/v1/public_jwk';
import { BasicError_BasicErrorCode } from '../../contracts/errors/v1/errors';
import { getDurableObjectInstance } from '../../lib/durable-object-wrapper/durable-object-accessor';
import { isNullOrUndefined } from '../../lib/lib';
import { logInfo } from '../../lib/logger';
import {
  addAuthenticatedToContext,
  addAuthenticationGuard,
} from '../../lib/middleware/authenticated-middleware';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf,
} from '../../lib/middleware/protobuf-middleware';
import { addRouter, route } from '../../lib/middleware/router-middleware';
import { hasRole, ROLES } from '../../lib/roles';
import { onFetch } from '../../lib/starter/on-fetch';
import { AuthenticationEnvironmentVariables } from './authentication-environment-variables';
import { createAuthenticationKv } from './authentication-kv';
import { verifyGoogleJwt } from './google-keys';
import { RolesStorage } from './roles-storage';
import { generateSharecationJwt } from './sharecation-keys';
// Make durable object visible
export { RolesStorage } from './roles-storage';

const SERVICE_NAME = 'authentication';

function getRolesStorageInstance(
  namespace: DurableObjectNamespace,
  context: {},
) {
  return getDurableObjectInstance(RolesStorage, namespace, '0', context);
}

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<AuthenticationEnvironmentVariables>(
    SERVICE_NAME,
    addRouter([
      route(
        'POST',
        ['v1', 'get-public-jwks'],
        protoBuf(null, GetPublicJwksResponse, async (request, env, _) => {
          const publicKeys = JSON.parse(env.PUBLIC_KEYS) as Array<
            JsonWebKey & { kid: string }
          >;
          return createProtoBufOkResponse<PublicJwks>({
            jwks: publicKeys.map((publicJwk) => ({
              jwk: JSON.stringify(publicJwk),
              kid: publicJwk.kid,
            })),
          });
        }),
      ),
      route(
        'POST',
        ['v1', 'get-public-jwks'],
        addAuthenticationGuard(
          protoBuf(
            UpsertPersonRequest,
            UpsertPersonResponse,
            async (request, env, context) => {
              return createProtoBufOkResponse<Person>({
                userId: context.user.userId,
                firstname: '',
                lastname: '',
              });
            },
          ),
        ),
      ),
      route(
        'POST',
        ['v1', 'create-authentication-with-firebase'],
        protoBuf(
          CreateAuthenticationWithFirebaseRequest,
          CreateAuthenticationWithFirebaseResponse,
          async (request, env, context) => {
            const jwtString = context.proto.body.firebaseJwtString;
            const authenticationKv = createAuthenticationKv(env.AUTHENTICATION);
            const userId = await verifyGoogleJwt(
              jwtString,
              authenticationKv,
              context,
            );
            if (isNullOrUndefined(userId)) {
              context.logger.error('JWT is not valid or expired');
              return createProtoBufBasicErrorResponse(
                'INVALID_JWT',
                BasicError_BasicErrorCode.BAD_REQUEST,
              );
            }
            const rolesStorage = getRolesStorageInstance(
              env.ROLES_STORAGE,
              context,
            );
            const roles = await rolesStorage.getRolesOfUser({ userId });
            context = addAuthenticatedToContext(
              userId,
              new Set(roles),
              context,
            );

            context.logger.info(`generating jwt for userId=${userId}`);
            const generated = await generateSharecationJwt(
              userId,
              roles,
              authenticationKv,
              context,
            );
            return createProtoBufOkResponse<Authenticated>({
              jwtString: generated.jwtString,
              data: {
                sub: generated.payload.sub,
                exp: generated.payload.exp,
              },
            });
          },
        ),
      ),
      route(
        'POST',
        ['v1', 'create-role-binding'],
        addAuthenticationGuard(
          protoBuf(
            CreateRoleBindingRequest,
            CreateRoleBindingResponse,
            async (request, env, context) => {
              const { userId, role } = context.proto.body;
              if (!hasRole(ROLES.ADMIN_ROLES_WRITE, context)) {
                context.logger.warn(
                  `User tried to create role without having permission. requiredRole=${ROLES.ADMIN_ROLES_WRITE}, userId=${context.user.userId}, roles=${context.user.roles}`,
                );
                return createProtoBufBasicErrorResponse(
                  `Not allowed to add role to user. userId=${userId}, role=${role}, requiredRole=${ROLES.ADMIN_ROLES_WRITE}`,
                  BasicError_BasicErrorCode.UNAUTHENTICATED,
                );
              }

              context.logger.info(`Adding role to user. role=${role}`);

              const rolesStorage = getRolesStorageInstance(
                env.ROLES_STORAGE,
                context,
              );
              await rolesStorage.addRoleToUser({ userId, role });

              return createProtoBufOkResponse<RoleBinding>({
                userId,
                role,
              });
            },
          ),
        ),
      ),
      route(
        'POST',
        ['v1', 'delete-role-binding'],
        addAuthenticationGuard(
          protoBuf(
            DeleteRoleBindingRequest,
            DeleteRoleBindingResponse,
            async (request, env, context) => {
              const { userId, role } = context.proto.body;
              if (!hasRole(ROLES.ADMIN_ROLES_DELETE, context)) {
                context.logger.warn(
                  `User tried to delete role without having permission. requiredRole=${ROLES.ADMIN_ROLES_DELETE}, userId=${context.user.userId}, roles=${context.user.roles}`,
                  context,
                );
                return createProtoBufBasicErrorResponse(
                  `Not allowed to delete role of user. userId=${userId}, role=${role}, requiredRole=${ROLES.ADMIN_ROLES_DELETE}`,
                  BasicError_BasicErrorCode.UNAUTHENTICATED,
                );
              }

              const rolesStorage = getRolesStorageInstance(
                env.ROLES_STORAGE,
                context,
              );
              context.logger.info(`Deleting role ${role}`);
              await rolesStorage.deleteRoleOfUser({ userId, role });

              return createProtoBufOkResponse<RoleBinding>({
                userId,
                role,
              });
            },
          ),
        ),
      ),
      route(
        'POST',
        ['v1', 'get-roles-of-user'],
        addAuthenticationGuard(
          protoBuf(
            GetRolesOfUserRequest,
            GetRolesOfUserResponse,
            async (request, env, context) => {
              if (!hasRole(ROLES.ADMIN_ROLES_READ, context)) {
                return createProtoBufBasicErrorResponse(
                  `role=${ROLES.ADMIN_ROLES_READ} is required to read roles of other users`,
                  BasicError_BasicErrorCode.UNAUTHENTICATED,
                );
              }
              const { userId } = context.proto.body;
              const rolesStorage = getRolesStorageInstance(
                env.ROLES_STORAGE,
                context,
              );
              const roles = await rolesStorage.getRolesOfUser({ userId });

              logInfo(
                `Got roles of user. roles=[${roles.join(', ')}]`,
                context,
              );
              return createProtoBufOkResponse<Roles>({
                roles: roles,
              });
            },
          ),
        ),
      ),
    ]),
  ),
};
