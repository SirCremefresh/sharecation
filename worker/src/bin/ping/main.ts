import {
  GetPingRequest,
  GetPingResponse,
} from '../../contracts/pings/v1/pings';
import { addLoggerContext } from '../../lib/middleware/logger-middleware';
import { protoBuf } from '../../lib/middleware/protobuf-middleware';
import { addRouter, route } from '../../lib/middleware/router-middleware';
import { onFetch } from '../../lib/starter/on-fetch';

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<{
    LOKI_SECRET: string;
    ENVIRONMENT: string;
    COMMON: KVNamespace;
  }>(
    addLoggerContext(
      'ping',
      addRouter([
        route('GET', ['test'], async (request, env, context) => {
          const as = await fetch(
            'https://development.sharecation-authentication.dowo.ch/test',
          ).then((res) => res.text());
          return new Response('from-ping' + as);
        }),
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
  ),
};
