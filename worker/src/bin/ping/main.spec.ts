import {describe, expect, test} from '@jest/globals';
import {GetPingRequest, GetPingResponse,} from '../../contracts/pings/v1/pings';
import {Headers, MediaType} from '../../lib/http/types';
import {mockLoggerMiddleware} from '../../lib/middleware/logger-middleware.mock';
import {buildFakeContext} from '../../test-lib/context-lib';
import {unwrapOk} from '../../test-lib/response-lib';

mockLoggerMiddleware();

const {default: ping} = await import('./main');


describe('Ping', () => {
  test('Should return pong with given pingId', async () => {
    let pingId = 'some-id';
    const getPingRequest: GetPingRequest = {
      pingId,
    };
    const request = new Request('https://fake.url/v1/get-ping', {
      method: 'POST',
      body: GetPingRequest.toJsonString(getPingRequest),
    });

    const response = await ping.fetch(
      request,
      {ENVIRONMENT: 'test', LOKI_SECRET: 'some'},
      buildFakeContext(),
    );

    const responseBody = GetPingResponse.fromJsonString(await response.text());
    const pingResponse = unwrapOk(responseBody);
    expect(pingResponse.pingId).toEqual(pingId);
    expect(pingResponse.message).toEqual('pong');
  });

  test('Should return pong with given pingId protobuf', async () => {
    let pingId = 'some-id';
    const getPingRequest: GetPingRequest = {
      pingId,
    };
    const request = new Request('https://fake.url/v1/get-ping', {
      method: 'POST',
      body: GetPingRequest.toBinary(getPingRequest),
      headers: {
        [Headers.ACCEPT]: MediaType.APPLICATION_OCTET_STREAM,
        [Headers.CONTENT_TYPE]: MediaType.APPLICATION_OCTET_STREAM,
      },
    });

    const response = await ping.fetch(
      request,
      {ENVIRONMENT: 'test', LOKI_SECRET: 'some'},
      buildFakeContext(),
    );

    const responseBody = GetPingResponse.fromBinary(
      new Uint8Array(await response.arrayBuffer()),
    );
    const pingResponse = unwrapOk(responseBody);
    expect(pingResponse.pingId).toEqual(pingId);
    expect(pingResponse.message).toEqual('pong');
  });
});
