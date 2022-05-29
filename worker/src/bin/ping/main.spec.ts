import {expect, test} from '@jest/globals';
import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {unwrapOk} from '../../test-lib/response-lib';
import ping from './main';

// const { COMMON } = getMiniflareBindings();


function buildFakeContext(): ExecutionContext {
  return {
    async waitUntil(promise: Promise<any>) {
      await promise;
    },
    passThroughOnException() {
    }
  };
}


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

// test('should increment the count', async () => {
//   // Seed the KV namespace
//   await COUNTER_NAMESPACE.put('a', '3');
//
//   // Perform the increment
//   const newValue = await increment(COUNTER_NAMESPACE, 'a');
//   const storedValue = await COUNTER_NAMESPACE.get('a');
//
//   // Check the return value of increment
//   expect(newValue).toBe(4);
//   // Check increment had the side effect of updating KV
//   expect(storedValue).toBe('4');
// });
//
// test('should return new count', async () => {
//   // Note we're using Worker APIs in our test, without importing anything extra
//   const request = new Request('http://localhost/a');
//   const response = await worker.fetch(request, {COUNTER_NAMESPACE});
//
//   // Each test gets its own isolated storage environment, so the changes to "a"
//   // are *undone* automatically. This means at the start of this test, "a"
//   // wasn't in COUNTER_NAMESPACE, so it defaulted to 0, and the count is now 1.
//   expect(await response.text()).toBe('count for /a is now 1');
// });
