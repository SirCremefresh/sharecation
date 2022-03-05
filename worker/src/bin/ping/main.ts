import {MessageType} from '@protobuf-ts/runtime';
import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {isNotNullOrUndefined} from '../../lib/lib';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Access-Control-Max-Age': '3600',
};

function protoBuf<REQUEST_BODY extends {},
  RESPONSE_BODY extends {},
  ENV extends {} = {},
  REQUEST extends Request = Request,
  CONTEXT extends ExecutionContext = ExecutionContext,
  RESPONSE extends Response = Response>(
  requestType: MessageType<REQUEST_BODY> | null,
  responseType: MessageType<RESPONSE_BODY>,
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & { body: REQUEST_BODY },
  ) => Promise<RESPONSE_BODY>,
) {
  return async (request: REQUEST, env: ENV, context: CONTEXT) => {
    // if (request.method === 'OPTIONS') {
    //   return new Response(null, {
    //     status: 200,
    //     headers: CORS_HEADERS,
    //   });
    // }

    let newContext;
    if (isNotNullOrUndefined(requestType)) {
      const buffer = await request.arrayBuffer();
      const uint8Array = new Uint8Array(buffer);
      const ping = requestType.fromBinary(uint8Array);
      newContext = Object.assign(context, {
        body: ping,
      });
    } else {
      newContext = Object.assign(context, {
        body: {},
      });
    }


    const response = await fn(request, env, newContext as CONTEXT & { body: REQUEST_BODY });

    return new Response(responseType.toBinary(responseType.fromJson(response)), {
      status: 200,
      headers: CORS_HEADERS,
    });
  };
}

const aa = protoBuf(GetPingRequest, GetPingResponse, async (request, env, context) => {

  return {
    ping: {
      pingId: context.body.pingId,
      message: 'dd',
    }
  };
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
