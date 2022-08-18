import {describe, expect, test} from '@jest/globals';
import {build} from 'esbuild';
import {Miniflare} from 'miniflare';
import {CreateRoleBindingResponse, RoleBinding} from '../../contracts/authentication/v1/authentication';
import {CreateGroupRequest, CreateGroupResponse, GetGroupsResponse} from '../../contracts/groups/v1/groups';
import {generateJwt} from '../../lib/authentication/jwt';
import {createProtoBufOkResponse} from '../../lib/middleware/protobuf-middleware';
import {unwrapOk} from '../../test-lib/response-lib';
import {exportPublicAndPrivateInJwk, generateKeys} from '../authentication-scheduled/generate-sharecation-keys';
import {FetchStub} from './fetch-stub-testing';

const out = await build({
  entryPoints: ['src/bin/groups/main.ts'],
  bundle: true,
  format: 'esm',
  write: false
});

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
    createRoleRequestStub.wasCalledExactly(1);
    expect(createRoleRequestStub.getLastJsonBody().role).toEqual(`groups:${pingResponse.groupId}:member`);
  });
});
