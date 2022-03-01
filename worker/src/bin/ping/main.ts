import {MessageType} from '@protobuf-ts/runtime';
import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Access-Control-Max-Age': '3600',
};

interface Payload<E> {
  request: Request;
  response?: Response;
  env: {};
  context: E;
}

interface Middleware<A, B> {
  aa(payload: Payload<A>, rest: Middleware<any, any>[]): Promise<Payload<A & B>>;
}

class M1 implements Middleware<{}, { a: string }> {
  async aa(payload: Payload<{}>, rest: Middleware<any, any>[]): Promise<Payload<{} & { a: string }>> {
    
    await rest[0].aa(payload, rest.slice(1));

    return {
      ...payload,
      context: {...payload.context, a: 'a'},
    };
  }
}

/* tslint:disable:max-line-length */
function middleware(): Promise<Payload<{}>>;
function middleware<A, B>(op1: Middleware<A, B>): Promise<Payload<B>>;
function middleware<A, B, C>(op1: Middleware<A, B>, op2: Middleware<B, C>): Promise<Payload<C>>;
function middleware<A, B, C, D>(op1: Middleware<A, B>, op2: Middleware<B, C>, op3: Middleware<C, D>): Promise<Payload<D>>;
function middleware(...operations: Middleware<any, any>[]): any {
  return async (payload: Payload<{}>): Promise<Response> => {
    let result = payload;
    for (let i = 0; i < operations.length - 1; i++) {
      result = await operations[i].aa(result);
    }
    return result.response!;
  };
}

middleware(new M1());


function onFetch<REQUEST_BODY extends {},
  RESPONSE_BODY extends {},
  ENV extends {} = {},
  REQUEST extends Request = Request,
  CONTEXT extends ExecutionContext = ExecutionContext,
  RESPONSE extends Response = Response>(
  reg: MessageType<REQUEST_BODY>,
  res: MessageType<RESPONSE_BODY>,
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & { body: REQUEST_BODY },
  ) => Promise<RESPONSE_BODY>,
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

    const ress = await fn(request, env, aa);

    return new Response(res.toBinary(res.fromJson(ress)), {
      status: 200,
      headers: CORS_HEADERS,
    });
  };
}

const aa = onFetch(GetPingRequest, GetPingResponse, async (request, env, context) => {
  return {
    ping: {
      pingId: context.body.pingId,
      message: 'pong',
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
