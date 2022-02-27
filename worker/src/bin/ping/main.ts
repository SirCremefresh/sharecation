import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/images';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';

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
      console.log('buffer: ', buffer.byteLength);
      const uint8Array = new Uint8Array(buffer);
      console.log('uint8Array:', uint8Array.byteLength);
      const ping = GetPingRequest.decode(uint8Array);

      context.logger.info(`ping with id ${ping.pingId}`);
      const response: GetPingResponse = {
        ping: {
          pingId: ping.pingId,
          message: 'pong',
        }
      };
      return new Response(
        new Uint8Array(GetPingResponse.encode(response).finish()),
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
