import {describe, expect, test} from '@jest/globals';
import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {MediaType} from '../../lib/http/types';
import {unwrapOk} from '../../test-lib/response-lib';
import {getTestingContainer} from '../../test-lib/test-container';

const testContainer = await getTestingContainer('ping');

describe('Ping', () => {
  test('Should return pong with given pingId', async () => {
    const testRun = await testContainer.initTest();

    let pingId = 'some-id';
    const getPingRequest: GetPingRequest = {
      pingId,
    };

    const response = await testRun.post({
      path: '/v1/get-ping',
      body: GetPingRequest.toJsonString(getPingRequest),
    });

    const pingResponse = unwrapOk(GetPingResponse.fromJsonString(await response.text()));
    expect(pingResponse.pingId).toEqual(pingId);
    expect(pingResponse.message).toEqual('pong');
  });

  test('Should return pong with given pingId protobuf', async () => {
    const testRun = await testContainer.initTest();

    let pingId = 'some-id';
    const getPingRequest: GetPingRequest = {
      pingId,
    };

    const response = await testRun.post({
      path: '/v1/get-ping',
      body: GetPingRequest.toBinary(getPingRequest),
      accept: MediaType.APPLICATION_OCTET_STREAM,
      contentType: MediaType.APPLICATION_OCTET_STREAM,
    });

    const responseBody = GetPingResponse.fromBinary(
      new Uint8Array(await response.arrayBuffer()),
    );
    const pingResponse = unwrapOk(responseBody);
    expect(pingResponse.pingId).toEqual(pingId);
    expect(pingResponse.message).toEqual('pong');
  });
});

