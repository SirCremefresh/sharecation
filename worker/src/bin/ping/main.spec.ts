import {describe, expect, test} from '@jest/globals';
import {build} from 'esbuild';
import {Miniflare} from 'miniflare';
import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
import {Headers, MediaType} from '../../lib/http/types';
import {isNotNullOrUndefined} from '../../lib/lib';
import {unwrapOk} from '../../test-lib/response-lib';

const out = await build({
  entryPoints: ['src/bin/ping/main.ts'],
  outfile: 'src/bin/ping/dist/main2.js',
  bundle: true,
  format: 'esm',
});
console.log(out);

function getUrl(request: Request | string) {
  if (typeof request === 'string') {
    return request;
  }
  return request.url;
}

class FetchStub {
  private stubs: {
    urlPattern: URLPattern,
    handler: (request: Request | string, requestInitr?: RequestInit | Request) => PromiseLike<Response>
  }[] = [];

  addStub(urlPattern: URLPattern, handler: (request: Request | string, requestInitr?: RequestInit | Request) => PromiseLike<Response>) {
    this.stubs.push({urlPattern, handler});
  }

  getFetch() {
    return async (request: Request | string, requestInitr?: RequestInit | Request) => {
      const stub = this.stubs.find(stub => stub.urlPattern.test(getUrl(request)));
      if (isNotNullOrUndefined(stub)) {
        return stub.handler(request, requestInitr);
      }
      throw new Error('No stub found');
    };
  }
}

const mf = new Miniflare({
  envPath: true,
  packagePath: true,
  wranglerConfigPath: true,
  wranglerConfigEnv: 'testing',
  modulesRules: [
    {type: 'ESModule', include: ['**/*.js'], fallthrough: true},
    {type: 'Text', include: ['**/*.txt']},
  ],
  scriptPath: 'src/bin/ping/dist/main2.js',
  modules: true,
});
//


describe('Ping', () => {
  test('Should return pong with given pingId', async () => {
    const fetchStub = new FetchStub();
    fetchStub.addStub(new URLPattern('https://logs-prod-eu-west-0.grafana.net/loki/api/v1/push'),
      async (request, requestInitr) => {
        return new Response('{}', {status: 200});
      });
    await mf.setOptions({
      globals: {
        TESTING_BASE_CONTEXT: {
          base: {
            fetch: fetchStub.getFetch()
          }
        }
      }
    });
    let pingId = 'some-id';
    const getPingRequest: GetPingRequest = {
      pingId,
    };

    const response = await mf.dispatchFetch('https://fake.url/v1/get-ping', {
      method: 'POST',
      body: GetPingRequest.toJsonString(getPingRequest),
    });

    const responseBody = GetPingResponse.fromJsonString(await response.text());
    const pingResponse = unwrapOk(responseBody);
    expect(pingResponse.pingId).toEqual(pingId);
    expect(pingResponse.message).toEqual('pong');
  });

  test('Should return pong with given pingId protobuf', async () => {
    const fetchStub = new FetchStub();
    fetchStub.addStub(new URLPattern('https://logs-prod-eu-west-0.grafana.net/loki/api/v1/push'),
      async (request, requestInitr) => {
        return new Response('{}', {status: 200});
      });
    await mf.setOptions({
      globals: {
        TESTING_BASE_CONTEXT: {
          base: {
            fetch: fetchStub.getFetch()
          }
        }
      }
    });
    let pingId = 'some-id';
    const getPingRequest: GetPingRequest = {
      pingId,
    };

    const response = await mf.dispatchFetch('https://fake.url/v1/get-ping', {
      method: 'POST',
      body: GetPingRequest.toBinary(getPingRequest),
      headers: {
        [Headers.ACCEPT]: MediaType.APPLICATION_OCTET_STREAM,
        [Headers.CONTENT_TYPE]: MediaType.APPLICATION_OCTET_STREAM,
      },
    });

    const responseBody = GetPingResponse.fromBinary(
      new Uint8Array(await response.arrayBuffer()),
    );
    const pingResponse = unwrapOk(responseBody);
    expect(pingResponse.pingId).toEqual(pingId);
    expect(pingResponse.message).toEqual('pong');
  });
});
