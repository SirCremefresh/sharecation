import {describe, expect, test} from '@jest/globals';
import {CreateRoleBindingResponse} from '../../contracts/authentication/v1/authentication';
import {CreateGroupRequest, CreateGroupResponse, GetGroupsResponse} from '../../contracts/groups/v1/groups';
import {createProtoBufOkResponse} from '../../lib/middleware/protobuf-middleware';
import {unwrapOk} from '../../test-lib/response-lib';
import {getTestingContainer} from '../../test-lib/test-container';
import {createGroupsKv} from './groups-kv';

const testContainer = await getTestingContainer('groups');

describe('Groups', () => {
  test('get groups has no groups', async () => {
    const testRun = await testContainer.initTest();
    const jwtString = await testRun.getJwt({roles: []});

    const response = await testRun.dispatchFetch('https://fake.url/v1/get-groups', {
      method: 'POST',
      body: null,
      headers: {
        'Authorization': `Bearer ${jwtString}`,
      }
    });

    const pingResponse = unwrapOk(GetGroupsResponse.fromJsonString(await response.text()));
    expect(pingResponse.groups.length).toEqual(0);
  });

  test('get groups with two groups', async () => {
    const testRun = await testContainer.initTest();
    const jwtString = await testRun.getJwt({roles: ['groups:group-id-1', 'groups:group-id-2']});
    const kvNamespace = createGroupsKv(await testRun.mf.getKVNamespace('GROUPS') as KVNamespace);
    const group1 = {
      groupId: 'group-id-1',
      name: 'group-name-1',
      createdAt: 'created-at',
    };
    const group2 = {
      groupId: 'group-id-2',
      name: 'group-name-2',
      createdAt: 'created-at',
    };
    await kvNamespace.groups.groupId(group1.groupId).put(group1);
    await kvNamespace.groups.groupId(group2.groupId).put(group2);

    const response = await testRun.dispatchFetch('https://fake.url/v1/get-groups', {
      method: 'POST',
      body: null,
      headers: {
        'Authorization': `Bearer ${jwtString}`,
      }
    });

    const pingResponse = unwrapOk(GetGroupsResponse.fromJsonString(await response.text()));
    expect(pingResponse.groups.length).toEqual(2);
    expect(pingResponse.groups[0].groupId).toEqual(group1.groupId);
    expect(pingResponse.groups[0].name).toEqual(group1.name);
    expect(pingResponse.groups[1].groupId).toEqual(group2.groupId);
    expect(pingResponse.groups[1].name).toEqual(group2.name);
  });

  test('get groups ignore role for not existing group', async () => {
    const testRun = await testContainer.initTest();
    const jwtString = await testRun.getJwt({roles: ['groups:group-id-2', 'groups:group-id-not-existing']});
    const kvNamespace = createGroupsKv(await testRun.mf.getKVNamespace('GROUPS') as KVNamespace);
    const group1 = {
      groupId: 'group-id-2',
      name: 'group-name-1',
      createdAt: 'created-at',
    };
    await kvNamespace.groups.groupId(group1.groupId).put(group1);

    const response = await testRun.dispatchFetch('https://fake.url/v1/get-groups', {
      method: 'POST',
      body: null,
      headers: {
        'Authorization': `Bearer ${jwtString}`,
      }
    });

    const pingResponse = unwrapOk(GetGroupsResponse.fromJsonString(await response.text()));
    expect(pingResponse.groups.length).toEqual(1);
    expect(pingResponse.groups[0].groupId).toEqual(group1.groupId);
    expect(pingResponse.groups[0].name).toEqual(group1.name);
  });

  test('create group', async () => {
    const testRun = await testContainer.initTest();
    const jwtString = await testRun.getJwt({roles: []});

    const createRoleRequestStub = testRun.globalFetchStub.addStub(new URLPattern('https://sharecation-authentication-development.dowo.ch/v1/create-role-binding'),
      async (_1, _2) => {
        return new Response(CreateRoleBindingResponse.toJsonString(createProtoBufOkResponse({
          userId: 'some-user-id',
          role: 'some-role-id',
        })), {status: 200});
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
