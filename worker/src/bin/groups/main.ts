import {responseOk} from '../../lib/lib';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<{ LOKI_SECRET: string; ENVIRONMENT: string, COMMON: KVNamespace }>(
    'groups',
    async (request, env, context) => {

      return responseOk({content: 'groups'});
    },
  ),
};
