import {describe, expect, test} from '@jest/globals';
import {build} from 'esbuild';
import {Miniflare} from 'miniflare';
import {CreateRoleBindingResponse, RoleBinding} from '../../contracts/authentication/v1/authentication';
import {CreateGroupRequest, CreateGroupResponse, GetGroupsResponse} from '../../contracts/groups/v1/groups';
import {generateJwt} from '../../lib/authentication/jwt';
import {isNotNullOrUndefined} from '../../lib/lib';
import {createProtoBufOkResponse} from '../../lib/middleware/protobuf-middleware';
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

class RequestStub {
  public timesCalled = 0;

  constructor(
    public readonly urlPattern: URLPattern,
    private readonly handler: (request: Request | string, requestInitr?: RequestInit | Request) => PromiseLike<Response>,
  ) {
  }

  public async handle(request: Request | string, requestInit?: RequestInit | Request) {
    this.timesCalled++;
    return this.handler(request, requestInit);
  }

  public wasCalled() {
    expect(this.timesCalled).toBeGreaterThan(0);
  }
}

class FetchStub {
  private stubs: RequestStub[] = [];

  addStub(urlPattern: URLPattern, handler: (request: Request | string, requestInitr?: RequestInit | Request) => PromiseLike<Response>) {
    const requestStub = new RequestStub(urlPattern, handler);
    this.stubs.push(requestStub);
    return requestStub;
  }

  getFetch() {
    return async (request: Request | string, requestInitr?: RequestInit | Request) => {
      const stub = this.stubs.find(stub => stub.urlPattern.test(getUrl(request)));
      if (isNotNullOrUndefined(stub)) {
        return stub.handle(request, requestInitr);
      }
      throw new Error(`No stub found for request=${JSON.stringify(request)}, requestInitr=${JSON.stringify(requestInitr)}`);
    };
  }
}

const mf = new Miniflare({
  envPath: true,
  packagePath: true,
  wranglerConfigPath: './src/bin/groups/wrangler.toml',
  wranglerConfigEnv: 'development',
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

  test('create group', async () => {
    const responsqwere: CreateRoleBindingResponse = createProtoBufOkResponse<RoleBinding>({
      userId: 'some-user-id',
      role: 'some-role-id',
    });
    console.log(CreateRoleBindingResponse.toJsonString(responsqwere));


    const fetchStub = new FetchStub();
    fetchStub.addStub(new URLPattern('https://logs-prod-eu-west-0.grafana.net/loki/api/v1/push'),
      async (request, requestInitr) => {
        console.log(requestInitr);
        return new Response('{}', {status: 200});
      });
    const createRoleRequestStub = fetchStub.addStub(new URLPattern('https://sharecation-authentication-development.dowo.ch/v1/create-role-binding'),
      async (request, requestInitr) => {
        const response: CreateRoleBindingResponse = createProtoBufOkResponse<RoleBinding>({
          userId: 'some-user-id',
          role: 'some-role-id',
        });
        return new Response(CreateRoleBindingResponse.toJsonString(response), {status: 200});
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

    const requst: CreateGroupRequest = {
      name: 'Some-cool-name'
    };

    const response = await mf.dispatchFetch('https://fake.url/v1/create-group', {
      method: 'POST',
      body: CreateGroupRequest.toJsonString(requst),
      headers: {
        'Authorization': `Bearer ${jwtString}`,
      }
    });

    const responseBody = CreateGroupResponse.fromJsonString(await response.text());
    const pingResponse = unwrapOk(responseBody);
    expect(pingResponse.name).toEqual('Some-cool-name');
    createRoleRequestStub.wasCalled();
  });
});
