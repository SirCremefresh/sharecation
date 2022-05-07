import {GetPingRequest, GetPingResponse,} from '../../contracts/pings/v1/pings';
import {protoBuf} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {onFetch} from '../../lib/starter/on-fetch';

type Environment = {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
  PUBLIC_KEYS: string;
  COMMON: KVNamespace;
};

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<Environment>(
    'ping',
    addRouter([
      route(
        'POST',
        [],
        protoBuf(
          GetPingRequest,
          GetPingResponse,
          async (request, env, context) => {
            return {
              ping: {
                pingId: context.proto.body.pingId,
                message: 'pong',
              },
            };
          },
        ),
      ),
    ]),
  ),
};
