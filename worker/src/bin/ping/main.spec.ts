import {expect, jest, test} from '@jest/globals';
import {Logger} from 'workers-loki-logger';
import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {LoggerContext, RequestIdContext} from '../../lib/middleware/context';
import {onFetch} from '../../lib/starter/on-fetch';
import * as OnFetch from '../../lib/starter/on-fetch';
import {buildFakeContext} from '../../test-lib/context-lib';
import {unwrapOk} from '../../test-lib/response-lib';
import ping from './main';

class FakeLogger extends Logger {
  override async flush(): Promise<void> {
    console.log('Flushing');
  }
}

function addFakeLogger<CONTEXT>(context: CONTEXT, lokiSecret: string): CONTEXT & LoggerContext {
  return Object.assign(context, {
    logger: new FakeLogger({
      lokiSecret,
      stream: {}
    })
  });
}

function addFakeRequestId<CONTEXT>(context: CONTEXT): CONTEXT & RequestIdContext {
  return Object.assign(context, {
    requestId: 'not-so-random-request-id'
  });
}

// jest.unstable_mockModule('../../lib/starter/on-fetch', () => {
//   return function () {
//     const onFetchMock: typeof onFetch = <ENV extends {
//       LOKI_SECRET: string;
//       ENVIRONMENT: string;
//     }>(serviceName: string, fn: (
//       request: Request,
//       env: ENV,
//       context: ExecutionContext & RequestIdContext & LoggerContext,
//     ) => Promise<Response>) => {
//       return (request: Request, env: ENV, context: ExecutionContext) => {
//         const newContext = addFakeRequestId(addFakeLogger(context, env.LOKI_SECRET));
//         return fn(request, env, newContext);
//       };
//     };
//     return {
//       onFetch: onFetchMock
//     };
//   };
// });


// jest.spyOn(OnFetch, 'onFetch').mockImplementation(
//   <ENV extends {
//     LOKI_SECRET: string;
//     ENVIRONMENT: string;
//   }>(serviceName: string, fn: (
//     request: Request,
//     env: ENV,
//     context: ExecutionContext & RequestIdContext & LoggerContext,
//   ) => Promise<Response>) => {
//     return (request: Request, env: ENV, context: ExecutionContext) => {
//       const newContext = addFakeRequestId(addFakeLogger(context, env.LOKI_SECRET));
//       return fn(request, env, newContext);
//     };
//   }
// );

test('Should return pong with given pingId', async () => {
  let pingId = 'some-id';
  const getPingRequest: GetPingRequest = {
    pingId
  };
  const request = new Request('https://fake.url/v1/get-ping', {
    method: 'POST',
    body: GetPingRequest.toJsonString(getPingRequest)
  });

  const response = await ping.fetch(request, {ENVIRONMENT: 'test', LOKI_SECRET: 'some'}, buildFakeContext());

  const responseBody = GetPingResponse.fromJsonString(await response.text());
  const pingResponse = unwrapOk(responseBody);
  expect(pingResponse.pingId).toEqual(pingId);
  expect(pingResponse.message).toEqual('pong');
});
