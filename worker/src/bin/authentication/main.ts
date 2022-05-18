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
import {GetPublicJwksResponse, PublicJwks} from '../../contracts/authentication/v1/public_jwk';
import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {isNullOrUndefined} from '../../lib/lib';
import {logInfo} from '../../lib/logger';
import {addAuthenticatedToContext, addAuthenticationGuard,} from '../../lib/middleware/authenticated-middleware';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf,
} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {hasRole, ROLES} from '../../lib/roles';
import {onFetch} from '../../lib/starter/on-fetch';
import {AuthenticationEnvironmentVariables} from './authentication-environment-variables';
import {createAuthenticationKv} from './authentication-kv';
import {verifyGoogleJwt} from './google-keys';
import {RolesStorage} from './roles-storage';
import {generateSharecationJwt} from './sharecation-keys';
// Make durable object visible
export {RolesStorage} from './roles-storage';

const SERVICE_NAME = 'authentication';

function getRolesStorageProxy(env: AuthenticationEnvironmentVariables) {
  return env.ROLES_STORAGE.get(env.ROLES_STORAGE.idFromName('0'));
}

type NormalizeDurableObjectMethods<T> = {
  [K in keyof T]: K extends 'fetch' ? never :
    T[K] extends (body: infer FIRST_ARG, ...args: any[]) => infer RETURN_TYPE ? (request: FIRST_ARG) => RETURN_TYPE :
      never
}

function doOf<E extends {}>(durableObjectNamespace: DurableObjectNamespace, name: string): NormalizeDurableObjectMethods<E> {
  return new Proxy({} as unknown as NormalizeDurableObjectMethods<E>, {
    get(_, method: string): any {
      return (argument: any) => {
        const id = durableObjectNamespace.idFromName(name);
        return durableObjectNamespace.get(id).fetch('https://dot.com/' + method, {
          body: JSON.stringify(argument),
          method: 'POST',
        }).then(res => res.json());
      };
    }
  });
}

async function getRolesOfUser(proxy: DurableObjectStub, userId: string) {
  return await proxy
    .fetch(proxyUrl(['v1', userId, 'roles']), {
      method: 'GET',
    })
    .then((res) => res.json<string[]>());
}

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<AuthenticationEnvironmentVariables>(
    SERVICE_NAME,
    addRouter([
      route(
        'POST',
        ['v1', 'get-public-jwks'],
        protoBuf(
          null,
          GetPublicJwksResponse,
          async (request, env, _) => {
            const publicKeys = JSON.parse(env.PUBLIC_KEYS) as Array<JsonWebKey & { kid: string }>;
            return createProtoBufOkResponse<PublicJwks>({
              jwks: publicKeys.map(publicJwk => ({
                jwk: JSON.stringify(publicJwk),
                kid: publicJwk.kid
              }))
            });
          }),
      ),
      route(
        'POST',
        ['v1', 'create-authentication-with-firebase'],
        protoBuf(
          CreateAuthenticationWithFirebaseRequest,
          CreateAuthenticationWithFirebaseResponse,
          async (request, env, context) => {
            const jwtString = context.proto.body.firebaseJwtString;
            const authenticationKv = createAuthenticationKv(
              env.AUTHENTICATION,
            );
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
            const proxy = getRolesStorageProxy(env);
            const roles = await getRolesOfUser(proxy, userId);
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
              const {userId, role} = context.proto.body;
              if (!hasRole(ROLES.ADMIN_ROLES_WRITE, context)) {
                context.logger.warn(
                  `User tried to create role without having permission. requiredRole=${ROLES.ADMIN_ROLES_WRITE}, userId=${context.user.userId}, roles=${context.user.roles}`
                );
                return createProtoBufBasicErrorResponse(
                  `Not allowed to add role to user. userId=${userId}, role=${role}, requiredRole=${ROLES.ADMIN_ROLES_WRITE}`,
                  BasicError_BasicErrorCode.UNAUTHENTICATED,
                );
              }


              context.logger.info(`Adding role to user. role=${role}`);

              const rolesStorage = doOf<RolesStorage>(env.ROLES_STORAGE, '0');
              await rolesStorage.addRoleToUser({userId, role});

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
        ['v1', 'delete-role-of-user'],
        addAuthenticationGuard(
          protoBuf(
            DeleteRoleBindingRequest,
            DeleteRoleBindingResponse,
            async (request, env, context) => {
              const {userId, role} = context.proto.body;
              if (!hasRole(ROLES.ADMIN_ROLES_READ, context)) {
                context.logger.warn(
                  `User tried to delete role without having permission. requiredRole=${ROLES.ADMIN_ROLES_WRITE}, userId=${context.user.userId}, roles=${context.user.roles}`,
                  context,
                );
                return createProtoBufBasicErrorResponse(
                  `Not allowed to delete role of user. userId=${userId}, role=${role}, requiredRole=${ROLES.ADMIN_ROLES_READ}`,
                  BasicError_BasicErrorCode.UNAUTHENTICATED,
                );
              }

              const proxy = getRolesStorageProxy(env);
              context.logger.info(`Deleting role ${role}`);
              await proxy.fetch(proxyUrl(['v1', userId, 'roles', role]), {
                method: 'DELETE',
              });

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
              const {userId} = context.proto.body;
              const rolesStorage = doOf<RolesStorage>(env.ROLES_STORAGE, '0');
              const roles = await rolesStorage.getRolesOfUser({userId});

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

function proxyUrl(segments: string[]) {
  return 'https://some.url/' + segments.join('/');
}
