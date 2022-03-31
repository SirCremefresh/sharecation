import {
  Authenticated,
  CreateAuthenticationWithFirebaseRequest,
  CreateAuthenticationWithFirebaseResponse,
  GetRightOfUserRequest,
  GetRightOfUserResponse,
  GetRightOfUserResponse_Right,
  GetRightsOfUserRequest,
  GetRightsOfUserResponse,
  GetRightsOfUserResponse_Rights,
  UpdateRightOfUserRequest,
  UpdateRightOfUserRequest_MutationType,
  UpdateRightOfUserResponse,
} from '../../contracts/authentication/v1/authentication';
import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {isNullOrUndefined, NEVER_FN,} from '../../lib/lib';
import {addAuthenticatedToContext, addAuthenticationGuard} from '../../lib/middleware/authenticated-middleware';
import {isExecutionContext} from '../../lib/middleware/context';
import {addLoggerContext,} from '../../lib/middleware/logger-middleware';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf
} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {hasRight, RIGHTS} from '../../lib/rights';
import {onFetch} from '../../lib/starter/on-fetch';
import {AuthenticationEnvironmentVariables} from './authentication-environment-variables';
import {createAuthenticationKv} from './authentication-kv';
import {verifyGoogleJwt} from './google-keys';
import {generateSharecationJwt,} from './sharecation-keys';
// Make durable object visible
export {RightsStorage} from './rights-storage';

const SERVICE_NAME = 'authentication';

function getRightsStorageProxy(env: AuthenticationEnvironmentVariables) {
  return env.RIGHTS_STORAGE.get(env.RIGHTS_STORAGE.idFromName('0'));
}

async function getRightsOfUser(proxy: DurableObjectStub, userId: string) {
  return await proxy.fetch(
    proxyUrl(['v1', userId, 'rights']), {
      method: 'GET'
    }).then(res => res.json<string[]>());
}

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<AuthenticationEnvironmentVariables>(
    addLoggerContext(SERVICE_NAME,
      addRouter([
        route(
          'GET',
          ['v1', 'get-public-keys'],
          async (request, env, context) => {
            try {
              const proxy = getRightsStorageProxy(env);
              const res = await proxy.fetch(request).then(res => res.text());
              return new Response(res);
            } catch (e) {
              return new Response('err' + e);
            }
          }
        ),
        route(
          'POST',
          ['v1', 'create-authentication-with-firebase'],
          protoBuf(CreateAuthenticationWithFirebaseRequest, CreateAuthenticationWithFirebaseResponse,
            async (request, env, context) => {
              const jwtString = context.proto.body.firebaseJwtString;
              const authenticationKv = createAuthenticationKv(env.AUTHENTICATION);
              const userId = await verifyGoogleJwt(jwtString, authenticationKv, context);
              if (isNullOrUndefined(userId)) {
                context.logger.error('JWT is not valid or expired');
                return createProtoBufBasicErrorResponse('INVALID_JWT', BasicError_BasicErrorCode.BAD_REQUEST);
              }
              const proxy = getRightsStorageProxy(env);
              const rights = await getRightsOfUser(proxy, userId);
              context = addAuthenticatedToContext(userId, new Set(rights), context);

              context.logger.info(`generating jwt for userId=${userId}`);
              const generated = await generateSharecationJwt(userId, rights, authenticationKv, context);
              return createProtoBufOkResponse<Authenticated>({
                jwtString: generated.jwtString,
                data: {
                  sub: generated.payload.sub,
                  exp: generated.payload.exp,
                }
              });
            },
          )
        ),
        route(
          'POST',
          ['v1', 'update-right-of-user'],
          addAuthenticationGuard(
            protoBuf(UpdateRightOfUserRequest, UpdateRightOfUserResponse,
              async (request, env, context) => {
                const {userId, right, mutationType} = context.proto.body;
                const ADMIN_RIGHT = 'ADMIN:' + right.split(':', 1)[0];
                if (!hasRight(ADMIN_RIGHT, context)) {
                  return createProtoBufBasicErrorResponse(`right: ${ADMIN_RIGHT} is required`, BasicError_BasicErrorCode.UNAUTHENTICATED);
                }

                const proxy = getRightsStorageProxy(env);
                if (mutationType === UpdateRightOfUserRequest_MutationType.UNSPECIFIED) {
                  return createProtoBufBasicErrorResponse('MutationType could not be parsed', BasicError_BasicErrorCode.BAD_REQUEST);
                } else if (mutationType === UpdateRightOfUserRequest_MutationType.ADD) {
                  context.logger.info(`Adding right ${right}`);
                  await proxy.fetch(proxyUrl(['v1', userId, 'rights']), {
                    body: JSON.stringify({
                      right
                    }),
                    method: 'POST'
                  });
                } else if (mutationType === UpdateRightOfUserRequest_MutationType.DELETE) {
                  context.logger.info(`Deleting right ${right}`);
                  await proxy.fetch(proxyUrl(['v1', userId, 'rights', right]), {
                    method: 'DELETE'
                  });
                } else {
                  NEVER_FN(mutationType);
                }


                return createProtoBufOkResponse<string>(userId);
              },
            )
          )
        ),
        route(
          'POST',
          ['v1', 'get-right-of-user'],
          addAuthenticationGuard(
            protoBuf(GetRightOfUserRequest, GetRightOfUserResponse,
              async (request, env, context) => {
                if (!hasRight(RIGHTS.ADMIN_RIGHT, context)) {
                  return createProtoBufBasicErrorResponse(`right: ${RIGHTS.ADMIN_RIGHT} is required to read right`, BasicError_BasicErrorCode.UNAUTHENTICATED);
                }
                const {userId, right} = context.proto.body;
                const proxy = getRightsStorageProxy(env);

                const rights = await proxy.fetch(
                  proxyUrl(['v1', userId, 'rights']), {
                    method: 'GET'
                  }).then(res => res.json<string[]>());

                return createProtoBufOkResponse<GetRightOfUserResponse_Right>({
                  hasRight: rights.includes(right),
                  right
                });
              },
            )
          )
        ),
        route(
          'POST',
          ['v1', 'get-rights-of-user'],
          addAuthenticationGuard(
            protoBuf(GetRightsOfUserRequest, GetRightsOfUserResponse,
              async (request, env, context) => {
                if (!hasRight(RIGHTS.ADMIN_RIGHT, context)) {
                  return createProtoBufBasicErrorResponse(`right: ${RIGHTS.ADMIN_RIGHT} is required to read right`, BasicError_BasicErrorCode.UNAUTHENTICATED);
                }
                const {userId} = context.proto.body;
                const proxy = getRightsStorageProxy(env);
                try {
                  const rights = await getRightsOfUser(proxy, userId);
                  context.logger.info('rights: ' + JSON.stringify(rights))
                  context.logger.info('isExcecutionContext: ' + isExecutionContext(context));

                  return createProtoBufOkResponse<GetRightsOfUserResponse_Rights>({
                    rights: rights
                  });
                } catch (e) {
                  context.logger.error('error on rewquest' + e);
                }

                return createProtoBufOkResponse<GetRightsOfUserResponse_Rights>({
                  rights: ['none']
                });
              },
            )
          )
        ),
      ]),
    ),
  )
};

function proxyUrl(segments: string[]) {
  return 'https://some.url/' + segments.join('/');
}
