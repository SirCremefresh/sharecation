import {describe, expect, test} from '@jest/globals';
import {CreateRoleBindingResponse, RoleBinding} from '../../contracts/authentication/v1/authentication';
import {CreateGroupRequest, CreateGroupResponse, GetGroupsResponse} from '../../contracts/groups/v1/groups';
import {createProtoBufOkResponse} from '../../lib/middleware/protobuf-middleware';
import {unwrapOk} from '../../test-lib/response-lib';
import {getTestingContainer} from './util-test';

const testContainer = await getTestingContainer('groups');

describe('Groups', () => {
  test('get groups', async () => {
    const testRun = await testContainer.initTest();
    const jwtString = await testRun.getJwt({roles: []});

    const response = await testRun.dispatchFetch('https://fake.url/v1/get-groups', {
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
    const testRun = await testContainer.initTest();
    const jwtString = await testRun.getJwt({roles: []});

    const createRoleRequestStub = testRun.globalFetchStub.addStub(new URLPattern('https://sharecation-authentication-development.dowo.ch/v1/create-role-binding'),
      async (request, requestInitr) => {
        const response: CreateRoleBindingResponse = createProtoBufOkResponse<RoleBinding>({
          userId: 'some-user-id',
          role: 'some-role-id',
        });
        return new Response(CreateRoleBindingResponse.toJsonString(response), {status: 200});
      });


    const response = await testRun.dispatchFetch('https://fake.url/v1/create-group', {
      method: 'POST',
      body: CreateGroupRequest.toJsonString({
        name: 'Some-cool-name'
      }),
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
