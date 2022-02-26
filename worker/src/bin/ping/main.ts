import {responseOk} from '../../lib/lib';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<{ LOKI_SECRET: string; ENVIRONMENT: string, COMMON: KVNamespace }>(
    'ping',
    async (request, env, context) => {
      context.logger.info('ping');
      return responseOk({content: 'pong dev '});
    },
  ),
};
