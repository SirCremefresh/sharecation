import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/images';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<{ LOKI_SECRET: string; ENVIRONMENT: string, COMMON: KVNamespace }>(
    'ping',
    async (request, env, context) => {
      const ping = GetPingRequest.decode(new Uint8Array(await request.arrayBuffer()));
      context.logger.info(`ping with id ${ping.pingId}`);
      const response: GetPingResponse = {
        ping: {
          pingId: ping.pingId,
          message: 'pong',
        }
      };
      return new Response(GetPingResponse.encode(response).finish());
    },
  ),
};
