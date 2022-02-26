import { responseOk } from '../../lib/lib';
import { addGuard } from '../../lib/middleware/guard-middleware';
import { addLoggerContext } from '../../lib/middleware/logger-middleware';
import {
  addRouter,
  route,
  routePath,
} from '../../lib/middleware/router-middleware';
import { generateSharecationJwt } from '../authentication/sharecation-keys';

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<{
    LOKI_SECRET: string;
    ENVIRONMENT: string;
    COMMON: KVNamespace;
  }>(
    'dev-tools',
    addGuard(
      (_request, env, _context) => env.ENVIRONMENT === 'development',
      addRouter([
        route('POST', routePath('v1', 'jwt'), async (request, env, context) => {
          const userId = crypto.randomUUID();
          const jwtString = await generateSharecationJwt(userId, ['group:abcd'],env.COMMON, context);
          return responseOk({
            userId,
            jwtString,
          });
        }),
      ]),
    ),
  ),
};
