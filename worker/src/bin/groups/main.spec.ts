import {describe, expect, test} from '@jest/globals';
import {build} from 'esbuild';
import {Miniflare} from 'miniflare';
import {GetGroupsResponse} from '../../contracts/groups/v1/groups';
import {generateJwt} from '../../lib/authentication/jwt';
import {isNotNullOrUndefined} from '../../lib/lib';
import {unwrapOk} from '../../test-lib/response-lib';
import {exportPublicAndPrivateInJwk, generateKeys} from '../authentication-scheduled/generate-sharecation-keys';

const out = await build({
  entryPoints: ['src/bin/groups/main.ts'],
  bundle: true,
  format: 'esm',
  write: false
});

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
  script: out.outputFiles[0].text,
  modules: true,
  bindings: {
    ENVIRONMENT: 'testing',
    LOKI_SECRET: 'some-secret',
  },
});

describe('Groups', () => {
  test('get groups', async () => {
    const fetchStub = new FetchStub();
    fetchStub.addStub(new URLPattern('https://logs-prod-eu-west-0.grafana.net/loki/api/v1/push'),
      async (request, requestInitr) => {
        console.log(requestInitr);
        return new Response('{}', {status: 200});
      });
    const {privateKey, publicKey} = await generateKeys();
    const {publicJkw} = await exportPublicAndPrivateInJwk(publicKey, privateKey);
    const {jwtString} = await generateJwt('some', [], privateKey, publicJkw.kid, Math.floor(Date.now() / 1000) + 60 * 60);

    await mf.setOptions({
      globals: {
        TESTING_BASE_CONTEXT: {
          base: {
            fetch: fetchStub.getFetch()
          }
        }
      },
      bindings: {
        ENVIRONMENT: 'testing',
        LOKI_SECRET: 'some-secret',
        PUBLIC_KEYS: JSON.stringify([publicJkw])
      },
    });

    const response = await mf.dispatchFetch('https://fake.url/v1/get-groups', {
      method: 'POST',
      body: null,
      headers: {
        'Authorization': `Bearer ${jwtString}`,
      }
    });

    const responseBody = GetGroupsResponse.fromJsonString(await response.text());
    const pingResponse = unwrapOk(responseBody);
    expect(pingResponse.groups.length).toEqual(0);
  });
});
