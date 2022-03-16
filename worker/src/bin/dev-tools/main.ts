import {responseOk} from '../../lib/lib';
import {addGuard} from '../../lib/middleware/guard-middleware';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';
import {addRouter, route,} from '../../lib/middleware/router-middleware';
import {onFetch} from '../../lib/starter/on-fetch';
import {generateSharecationJwt} from '../authentication/sharecation-keys';

type EnvironmentVariables = {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
  COMMON: KVNamespace;
};

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<EnvironmentVariables>(
    addLoggerContext(
      'dev-tools',
      addGuard(
        (_request, env, _context) => env.ENVIRONMENT === 'development',
        addRouter([
          route('POST', ['v1', 'jwt'], async (request, env, context) => {
            const userId = crypto.randomUUID();
            const jwtString = await generateSharecationJwt(userId, ['group:abcd'], env.COMMON, context);
            return responseOk(JSON.stringify({
              userId,
              jwtString,
            }));
          }),
        ]),
      ),
    ),
  )
};
