import {
  Authenticated,
  CreateAuthenticationWithFirebaseRequest,
  CreateAuthenticationWithFirebaseResponse,
  CreateRightBindingRequest,
  CreateRightBindingResponse,
  DeleteRightBindingRequest,
  DeleteRightBindingResponse,
  GetHasRightBindingRequest,
  GetHasRightBindingResponse,
  GetHasRightBindingResponse_HasRightBinding,
  GetRightsOfUserRequest,
  GetRightsOfUserResponse,
  RightBinding,
  Rights,
} from '../../contracts/authentication/v1/authentication';
import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {isNullOrUndefined} from '../../lib/lib';
import {logInfo} from '../../lib/logger';
import {addAuthenticatedToContext, addAuthenticationGuard,} from '../../lib/middleware/authenticated-middleware';
import {AuthenticatedContext} from '../../lib/middleware/context';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf,
} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {hasRight, RIGHTS} from '../../lib/rights';
import {onFetch} from '../../lib/starter/on-fetch';
import {AuthenticationEnvironmentVariables} from './authentication-environment-variables';
import {createAuthenticationKv} from './authentication-kv';
import {verifyGoogleJwt} from './google-keys';
import {generateSharecationJwt} from './sharecation-keys';
// Make durable object visible
export {RightsStorage} from './rights-storage';

const SERVICE_NAME = 'authentication';

function getRightsStorageProxy(env: AuthenticationEnvironmentVariables) {
  return env.RIGHTS_STORAGE.get(env.RIGHTS_STORAGE.idFromName('0'));
}

async function getRightsOfUser(proxy: DurableObjectStub, userId: string) {
  return await proxy
    .fetch(proxyUrl(['v1', userId, 'rights']), {
      method: 'GET',
    })
    .then((res) => res.json<string[]>());
}

function canUserEditRight(right: string, context: AuthenticatedContext) {
  const ADMIN_RIGHT = 'admin:' + right.split(':', 1)[0];
  const canEdit = hasRight(ADMIN_RIGHT, context);
  if (!canEdit) {
    logInfo(
      `User tried to edit right without having permission. requiredRight=${ADMIN_RIGHT}, userId=${context.user.userId}, rights=${context.user.rights}`,
      context,
    );
  }
  return canEdit;
}

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<AuthenticationEnvironmentVariables>(
    addLoggerContext(
      SERVICE_NAME,
      addRouter([
        route(
          'GET',
          ['v1', 'get-public-keys'],
          async (request, env, context) => {
            try {
              const proxy = getRightsStorageProxy(env);
              const res = await proxy.fetch(request).then((res) => res.text());
              return new Response(res);
            } catch (e) {
              return new Response('err' + e);
            }
          },
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
              const proxy = getRightsStorageProxy(env);
              const rights = await getRightsOfUser(proxy, userId);
              context = addAuthenticatedToContext(
                userId,
                new Set(rights),
                context,
              );

              context.logger.info(`generating jwt for userId=${userId}`);
              const generated = await generateSharecationJwt(
                userId,
                rights,
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
          ['v1', 'create-right-of-user'],
          addAuthenticationGuard(
            protoBuf(
              CreateRightBindingRequest,
              CreateRightBindingResponse,
              async (request, env, context) => {
                const {userId, right} = context.proto.body;
                const userCanEditRight = canUserEditRight(right, context);
                if (!userCanEditRight) {
                  return createProtoBufBasicErrorResponse(
                    `Not allowed to add right of user. userId=${userId}, right=${right}, s=${
                      'ADMIN:' + right.split(':', 1)[0]
                    }, asdf=${context.user.rights}`,
                    BasicError_BasicErrorCode.UNAUTHENTICATED,
                  );
                }

                const proxy = getRightsStorageProxy(env);
                context.logger.info(`Adding right to user. right=${right}`);
                await proxy.fetch(proxyUrl(['v1', userId, 'rights']), {
                  body: JSON.stringify({
                    right,
                  }),
                  method: 'POST',
                });

                return createProtoBufOkResponse<RightBinding>({
                  userId,
                  right,
                });
              },
            ),
          ),
        ),
        route(
          'POST',
          ['v1', 'delete-right-of-user'],
          addAuthenticationGuard(
            protoBuf(
              DeleteRightBindingRequest,
              DeleteRightBindingResponse,
              async (request, env, context) => {
                const {userId, right} = context.proto.body;
                const userCanEditRight = canUserEditRight(right, context);
                if (!userCanEditRight) {
                  return createProtoBufBasicErrorResponse(
                    `Not allowed to delete right of user. userId=${userId}, right=${right}`,
                    BasicError_BasicErrorCode.UNAUTHENTICATED,
                  );
                }

                const proxy = getRightsStorageProxy(env);
                context.logger.info(`Deleting right ${right}`);
                await proxy.fetch(proxyUrl(['v1', userId, 'rights', right]), {
                  method: 'DELETE',
                });

                return createProtoBufOkResponse<RightBinding>({
                  userId,
                  right,
                });
              },
            ),
          ),
        ),
        route(
          'POST',
          ['v1', 'get-right-of-user'],
          addAuthenticationGuard(
            protoBuf(
              GetHasRightBindingRequest,
              GetHasRightBindingResponse,
              async (request, env, context) => {
                if (!hasRight(RIGHTS.ADMIN_RIGHT, context)) {
                  return createProtoBufBasicErrorResponse(
                    `right: ${RIGHTS.ADMIN_RIGHT} is required to read right`,
                    BasicError_BasicErrorCode.UNAUTHENTICATED,
                  );
                }
                const {userId, right} = context.proto.body;
                const proxy = getRightsStorageProxy(env);

                const rights = await proxy
                  .fetch(proxyUrl(['v1', userId, 'rights']), {
                    method: 'GET',
                  })
                  .then((res) => res.json<string[]>());

                return createProtoBufOkResponse<GetHasRightBindingResponse_HasRightBinding>(
                  {
                    hasRightBinding: rights.includes(right),
                  },
                );
              },
            ),
          ),
        ),
        route(
          'POST',
          ['v1', 'get-rights-of-user'],
          addAuthenticationGuard(
            protoBuf(
              GetRightsOfUserRequest,
              GetRightsOfUserResponse,
              async (request, env, context) => {
                if (!hasRight(RIGHTS.ADMIN_RIGHT, context)) {
                  return createProtoBufBasicErrorResponse(
                    `Right=${RIGHTS.ADMIN_RIGHT} is required to read right`,
                    BasicError_BasicErrorCode.UNAUTHENTICATED,
                  );
                }
                const {userId} = context.proto.body;
                const proxy = getRightsStorageProxy(env);
                const rights = await getRightsOfUser(proxy, userId);

                logInfo(
                  `Got rights of user. rights=[${rights.join(', ')}]`,
                  context,
                );
                return createProtoBufOkResponse<Rights>({
                  rights: rights,
                });
              },
            ),
          ),
        ),
      ]),
    ),
  ),
};

function proxyUrl(segments: string[]) {
  return 'https://some.url/' + segments.join('/');
}
