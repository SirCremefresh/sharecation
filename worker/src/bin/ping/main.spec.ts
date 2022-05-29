import {expect, test} from '@jest/globals';
import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {buildFakeContext} from '../../test-lib/context-lib';
import {unwrapOk} from '../../test-lib/response-lib';
import ping from './main';

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
