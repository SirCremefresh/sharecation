import {
  Authenticated,
  CreateAuthenticationWithFirebaseRequest,
  CreateAuthenticationWithFirebaseResponse,
} from '../../contracts/authentication/v1/authentication';
import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {isNullOrUndefined,} from '../../lib/lib';
import {addAuthenticatedToContext} from '../../lib/middleware/authenticated-middleware';
import {addLoggerContext,} from '../../lib/middleware/logger-middleware';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf
} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {onFetch} from '../../lib/starter/on-fetch';
import {verifyGoogleJwt} from './google-keys';
import {generateSharecationJwt,} from './sharecation-keys';

const SERVICE_NAME = 'authentication';

interface EnvironmentVariables {
  ENVIRONMENT: string;
  COMMON: KVNamespace;
  LOKI_SECRET: string;
}

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<EnvironmentVariables>(
    addLoggerContext(SERVICE_NAME,
      addRouter([
        route(
          'POST',
          ['v1', 'token'],
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
        )
      ]),
    ),
  )
};
