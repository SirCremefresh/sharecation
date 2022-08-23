import {describe, expect, test} from '@jest/globals';
import {CreateRoleBindingResponse} from '../../contracts/authentication/v1/authentication';
import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {CreateGroupRequest, CreateGroupResponse, GetGroupsResponse} from '../../contracts/groups/v1/groups';
import {createProtoBufOkResponse} from '../../lib/middleware/protobuf-middleware';
import {unwrapError, unwrapOk} from '../../test-lib/response-lib';
import {getTestingContainer} from '../../test-lib/test-container';
import {GroupsKv} from './groups-kv';

const testContainer = await getTestingContainer('groups');

describe('Groups', () => {
  test('get groups has no groups', async () => {
    const testRun = await testContainer.initTest();

    const response = await testRun.post({
      path: '/v1/get-groups',
      authenticated: {
        roles: []
      }
    });

    const pingResponse = unwrapOk(GetGroupsResponse.fromJsonString(await response.text()));
    expect(pingResponse.groups.length).toEqual(0);
  });

  test('get groups un authenticated', async () => {
    const testRun = await testContainer.initTest();

    const response = await testRun.post({
      path: '/v1/get-groups',
    });

    const pingResponse = unwrapError(GetGroupsResponse.fromJsonString(await response.text()));
    expect(pingResponse.code).toEqual(BasicError_BasicErrorCode.UNAUTHENTICATED);
    expect(pingResponse.message).toEqual('Authentication was unsuccessful');
  });

  test('get groups with two groups', async () => {
    const testRun = await testContainer.initTest();
    const kvNamespace = await testRun.getKv<GroupsKv>('GROUPS');
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

    const response = await testRun.post({
      path: '/v1/get-groups',
      authenticated: {
        roles: ['groups:group-id-1', 'groups:group-id-2']
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
    const kvNamespace = await testRun.getKv<GroupsKv>('GROUPS');
    const group1 = {
      groupId: 'group-id-2',
      name: 'group-name-1',
      createdAt: 'created-at',
    };
    await kvNamespace.groups.groupId(group1.groupId).put(group1);

    const response = await testRun.post({
      path: '/v1/get-groups',
      authenticated: {
        roles: ['groups:group-id-2', 'groups:group-id-not-existing']
      }
    });

    const pingResponse = unwrapOk(GetGroupsResponse.fromJsonString(await response.text()));
    expect(pingResponse.groups.length).toEqual(1);
    expect(pingResponse.groups[0].groupId).toEqual(group1.groupId);
    expect(pingResponse.groups[0].name).toEqual(group1.name);
  });

  test('create group', async () => {
    const testRun = await testContainer.initTest();
    const createRoleRequestStub = testRun.globalFetchStub.addStaticOkStub(
      new URLPattern('https://sharecation-authentication-development.dowo.ch/v1/create-role-binding'),
      CreateRoleBindingResponse.toJsonString(createProtoBufOkResponse({
        userId: 'some-user-id',
        role: 'some-role-id',
      }))
    );

    const response = await testRun.post({
      path: '/v1/create-group',
      body: CreateGroupRequest.toJsonString({
        name: 'Some-cool-name'
      }),
      authenticated: {
        roles: []
      }
    });

    const responseBody = CreateGroupResponse.fromJsonString(await response.text());
    const pingResponse = unwrapOk(responseBody);
    expect(pingResponse.name).toEqual('Some-cool-name');
    createRoleRequestStub.wasCalledExactly(1);
    expect(createRoleRequestStub.getLastJsonBody().role).toEqual(`groups:${pingResponse.groupId}:member`);
  });
});
