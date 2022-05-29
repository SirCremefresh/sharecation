import {GetPingRequest, GetPingResponse, Ping,} from '../../contracts/pings/v1/pings';
import {createProtoBufOkResponse, protoBuf} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {onFetch} from '../../lib/starter/on-fetch';

type Environment = {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
};

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<Environment>(
    'ping',
    addRouter([
      route(
        'POST',
        ['v1', 'get-ping'],
        protoBuf(
          GetPingRequest,
          GetPingResponse,
          async (request, env, context) => {
            let pingId = context.proto.body.pingId;

            context.logger.info(`received ping with pingId=${pingId}`)
            return createProtoBufOkResponse<Ping>({
              pingId: pingId,
              message: 'pong',
            });
          },
        ),
      ),
    ]),
  ),
};
