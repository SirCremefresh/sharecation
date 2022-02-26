import {isNullOrUndefined, responseErrReason, responseOk,} from '../../lib/lib';
import {addAuthenticatedToContext} from '../../lib/middleware/authenticated-middleware';
import {LoggerContext} from '../../lib/middleware/context';
import {addLoggerContext,} from '../../lib/middleware/logger-middleware';
import {addRouter, route, routePath} from '../../lib/middleware/router-middleware';
import {verifyGoogleJwt} from './google-keys';
import {generateSharecationJwt,} from './sharecation-keys';

const SERVICE_NAME = 'authentication';

function parseBody(body: any): { jwtString: string } | null {
  if (!body.hasOwnProperty('jwtString') || typeof body.jwtString !== 'string') {
    return null;
  }
  return {jwtString: body.jwtString};
}

interface Env {
  ENVIRONMENT: string;
  COMMON: KVNamespace;
  LOKI_SECRET: string;
}

async function authenticateUser(request: Request, context: ExecutionContext & LoggerContext, env: Env) {
  const body = parseBody(await request.json());
  if (isNullOrUndefined(body)) {
    context.logger.error(
      'The request body must contain a jwtString property of type string.',
    );
    return responseErrReason('INVALID_REQUEST_BODY', 400);
  }
  const jwtString = body.jwtString;
  const userId = await verifyGoogleJwt(jwtString, env.COMMON, context);
  if (isNullOrUndefined(userId)) {
    context.logger.error('JWT is not valid or expired');
    return responseErrReason('INVALID_JWT', 401);
  }
  context = addAuthenticatedToContext(userId, new Set(), context);

  context.logger.info('generating jwt for userId=' + userId);
  const generated = await generateSharecationJwt(userId, [], env.COMMON, context);
  return responseOk(generated);
}

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<Env>(SERVICE_NAME, addRouter([
      route(
        'POST',
        routePath('v1', 'token'),
        async (request, env, context) => {
          return await authenticateUser(request, context, env);
        },
      ),
      route(
        'POST',
        routePath('v1', 'admin', 'rights'),
        async (request, env, context) => {
          return await authenticateUser(request, context, env);
        },
      )
    ]),
  ),
};
