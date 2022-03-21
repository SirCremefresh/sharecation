import {
  Authenticated,
  CreateAuthenticationWithFirebaseRequest,
  CreateAuthenticationWithFirebaseResponse,
  UpdateRightOfUserRequest,
  UpdateRightOfUserRequest_MutationType,
  UpdateRightOfUserResponse,
} from '../../contracts/authentication/v1/authentication';
import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {isNullOrUndefined, NEVER_FN,} from '../../lib/lib';
import {addAuthenticatedToContext, addAuthenticationGuard} from '../../lib/middleware/authenticated-middleware';
import {addLoggerContext,} from '../../lib/middleware/logger-middleware';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf
} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {hasRight} from '../../lib/rights';
import {onFetch} from '../../lib/starter/on-fetch';
import {AUTHENTICATION_KV} from './authentication-kv';
import {verifyGoogleJwt} from './google-keys';
import {generateSharecationJwt,} from './sharecation-keys';

const SERVICE_NAME = 'authentication';

interface EnvironmentVariables {
  ENVIRONMENT: string;
  COMMON: KVNamespace;
  AUTHENTICATION: KVNamespace;
  LOKI_SECRET: string;
}

const EMPTY_ARRAY_BUFFER = new ArrayBuffer(1);

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<EnvironmentVariables>(
    addLoggerContext(SERVICE_NAME,
      addRouter([
        route(
          'POST',
          ['v1', 'create-authentication-with-firebase'],
          protoBuf(CreateAuthenticationWithFirebaseRequest, CreateAuthenticationWithFirebaseResponse,
            async (request, env, context) => {
              const jwtString = context.proto.body.firebaseJwtString;
              const userId = await verifyGoogleJwt(jwtString, env.COMMON, context);
              if (isNullOrUndefined(userId)) {
                context.logger.error('JWT is not valid or expired');
                return createProtoBufBasicErrorResponse('INVALID_JWT', BasicError_BasicErrorCode.BAD_REQUEST);
              }
              context = addAuthenticatedToContext(userId, new Set(), context);

              context.logger.info('generating jwt for userId=' + userId);
              const generated = await generateSharecationJwt(userId, [], env.COMMON, context);
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
                  return createProtoBufBasicErrorResponse('MutationType could not be parsed', BasicError_BasicErrorCode.UNAUTHENTICATED);
                }

                const key = AUTHENTICATION_KV.USER_RIGHT(userId, right);
                switch (mutationType) {
                  case UpdateRightOfUserRequest_MutationType.UNSPECIFIED:
                    return createProtoBufBasicErrorResponse('MutationType could not be parsed', BasicError_BasicErrorCode.BAD_REQUEST);
                  case UpdateRightOfUserRequest_MutationType.ADD:
                    context.logger.info(`Adding right ${right}`);
                    await env.AUTHENTICATION.put(key, EMPTY_ARRAY_BUFFER);
                    break;
                  case UpdateRightOfUserRequest_MutationType.DELETE:
                    context.logger.info(`Deleting right ${right}`);
                    await env.AUTHENTICATION.delete(key);
                    break;
                  default:
                    NEVER_FN(mutationType);
                }

                return createProtoBufOkResponse<string>(userId);
              },
            )
          )
        )
      ]),
    ),
  )
};
