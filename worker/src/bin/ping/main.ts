import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';
import {protoBuf} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<{ LOKI_SECRET: string; ENVIRONMENT: string, COMMON: KVNamespace }>(
    'ping',
    // fetch: addNoop(
    addRouter([
      route(
        'POST',
        '/ping',
        protoBuf(
          GetPingRequest, GetPingResponse,
          async (request, env, context) => {
            context.proto.body.pingId
            return {
              ping: {
                pingId: 'request.pingId',
                message: 'pong',
              }
            };
          }
        )
      )
    ])
  )
};


// protoBuf(GetPingRequest, GetPingResponse, async (request, env, context) => {
//   const groupId = context.route.params.groupId;
//   console.log(groupId);
//   return {
//     ping: {
//       pingId: '',
//       message: 'pong'
//     }
//   };
// })

// const aa = addLoggerContext<{ LOKI_SECRET: string; ENVIRONMENT: string, COMMON: KVNamespace }>(
//   'ping',
//   async (request, env, context) => {
//     if (request.method === 'OPTIONS') {
//       context.logger.info(`handling OPTIONS request`);
//       return new Response('', {
//         status: 200,
//         headers: {
//           'Access-Control-Allow-Origin': '*',
//           'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
//           'Access-Control-Allow-Headers': 'Content-Type',
//           'Access-Control-Max-Age': '3600',
//         },
//       });
//     }
//     // console.log(await request.text());
//     // return responseOk(`pong`);
//     const buffer = await request.arrayBuffer();
//     const uint8Array = new Uint8Array(buffer);
//     const ping = GetPingRequest.fromBinary(uint8Array);
//
//     context.logger.info(`ping with id ${ping.pingId}`);
//     const response = GetPingResponse.fromJson({
//       ping: {
//         pingId: ping.pingId,
//         message: 'pong',
//       }
//     });
//     return new Response(
//       GetPingResponse.toBinary(response),
//       {
//         status: 200,
//         headers: {
//           'Content-Type': 'application/octet-stream',
//           'Access-Control-Allow-Origin': '*',
//           'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
//         },
//       });
//   },
// );
