import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';
import {protoBuf} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<{ LOKI_SECRET: string; ENVIRONMENT: string, COMMON: KVNamespace }>(
    'ping',
    addRouter([
      route(
        'POST',
        [],
        protoBuf(
          GetPingRequest, GetPingResponse,
          async (request, env, context) => {
            return {
              ping: {
                pingId: context.proto.body.pingId,
                message: 'pong',
              }
            };
          }
        )
      )
    ])
  )
};
