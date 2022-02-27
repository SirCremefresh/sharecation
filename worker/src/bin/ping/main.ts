import {MessageType} from '@protobuf-ts/runtime';
import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Access-Control-Max-Age': '3600',
};

type Unboxed<T> =
  T extends MessageType<infer U>
    ? U
    : never;


function onFetch<REQUEST_BODY extends MessageType<any>,
  RR extends Unboxed<REQUEST_BODY> = Unboxed<REQUEST_BODY>,
  ENV extends {} = {},
  REQUEST extends Request = Request,
  CONTEXT extends ExecutionContext = ExecutionContext,
  RESPONSE extends Response = Response>(
  reg: REQUEST_BODY,
  res: MessageType<any>,
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & { body: RR },
  ) => Promise<RR>,
) {
  return async (request: REQUEST, env: ENV, context: CONTEXT) => {
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        status: 200,
        headers: CORS_HEADERS,
      });
    }

    const buffer = await request.arrayBuffer();
    const uint8Array = new Uint8Array(buffer);
    const ping = reg.fromBinary(uint8Array);

    const aa = Object.assign(context, {
      body: ping,
    });

    await fn(request, env, aa);

    return new Response(ping, {
      status: 200,
      headers: CORS_HEADERS,
    });
  };
}

const aa = onFetch(GetPingRequest, GetPingRequest, async (request, env, context) => {
  type JJ = Unboxed<typeof GetPingRequest>;

  type AA = typeof GetPingRequest extends MessageType<infer U>
    ? U
    : never;

  const aa = context.body;

  context.body;
  return context.body;
});

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<{ LOKI_SECRET: string; ENVIRONMENT: string, COMMON: KVNamespace }>(
    'ping',
    async (request, env, context) => {
      if (request.method === 'OPTIONS') {
        context.logger.info(`handling OPTIONS request`);
        return new Response('', {
          status: 200,
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Max-Age': '3600',
          },
        });
      }
      // console.log(await request.text());
      // return responseOk(`pong`);
      const buffer = await request.arrayBuffer();
      const uint8Array = new Uint8Array(buffer);
      const ping = GetPingRequest.fromBinary(uint8Array);

      context.logger.info(`ping with id ${ping.pingId}`);
      const response = GetPingResponse.fromJson({
        ping: {
          pingId: ping.pingId,
          message: 'pong',
        }
      });
      return new Response(
        GetPingResponse.toBinary(response),
        {
          status: 200,
          headers: {
            'Content-Type': 'application/octet-stream',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          },
        });
    },
  ),
};
