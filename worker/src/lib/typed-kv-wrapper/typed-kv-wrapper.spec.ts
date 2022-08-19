import {describe, expect, test} from '@jest/globals';
import {getTypedKVInstance, KVKey, NestedKVKey} from './typed-kv-wrapper';

interface TestKv {
  roles: NestedKVKey<['userId', 'roleId'], { roleName: string }>;
  users: NestedKVKey<['userId'], { firstName: string }, { firstName: string }>;
  privateKey: KVKey<string>;
}

declare const getMiniflareBindings: () => { [key: string]: KVNamespace };
const {COMMON} = getMiniflareBindings();

describe('typed-kv', () => {
  test('put on kvKey', async () => {
    const testValue = crypto.randomUUID();
    const kvInstance = getTypedKVInstance<TestKv>(COMMON);
    await kvInstance.privateKey.put(testValue);
    expect(await COMMON.get('privateKey:', 'json')).toEqual(testValue);
  });

  test('get on kvKey', async () => {
    const testValue = crypto.randomUUID();
    const kvInstance = getTypedKVInstance<TestKv>(COMMON);
    await COMMON.put('privateKey:', JSON.stringify(testValue));
    expect(await kvInstance.privateKey.get()).toEqual(testValue);
  });

  test('put on nestedKvKey', async () => {
    const testValue = {roleName: 'some-role-name'};
    const kvInstance = getTypedKVInstance<TestKv>(COMMON);
    await kvInstance.roles
      .userId('some-user-id')
      .roleId('some-role-id')
      .put(testValue);
    expect(
      await COMMON.get(
        'roles:userId:some-user-id:roleId:some-role-id:',
        'json',
      ),
    ).toEqual(testValue);
  });

  test('get on nestedKvKey', async () => {
    const testValue = {roleName: crypto.randomUUID()};
    const kvInstance = getTypedKVInstance<TestKv>(COMMON);
    await COMMON.put(
      'roles:userId:some-user-id:roleId:some-role-id:',
      JSON.stringify(testValue),
    );
    expect(
      await kvInstance.roles
        .userId('some-user-id')
        .roleId('some-role-id')
        .get(),
    ).toEqual(testValue);
  });

  test('get on not existing nestedKvKey should fail', async () => {
    const kvInstance = getTypedKVInstance<TestKv>(COMMON);

    await expect(
      kvInstance.roles
        .userId('not')
        .roleId('existing')
        .get(),
    ).rejects.toBeInstanceOf(Error);
  });

  test('list on nestedKvKey', async () => {
    const testValue1 = {roleName: crypto.randomUUID()};
    const testValue2 = {roleName: crypto.randomUUID()};
    const userId = crypto.randomUUID();
    const kvInstance = getTypedKVInstance<TestKv>(COMMON);
    const user = kvInstance.roles.userId(userId);

    await user.roleId('role-id-1').put(testValue1);
    await user.roleId('role-id-2').put(testValue2);

    const roles = await user.list();
    expect(roles.keys.length).toEqual(2);
    expect(roles.keys[0].name).toEqual(
      `roles:userId:${userId}:roleId:role-id-1:`,
    );
    expect(roles.keys[1].name).toEqual(
      `roles:userId:${userId}:roleId:role-id-2:`,
    );
  });

  test('list on nestedKvKey with metadata', async () => {
    const testValue1 = {firstName: crypto.randomUUID()};
    const testValue2 = {firstName: crypto.randomUUID()};
    const userId1 = '1' + crypto.randomUUID();
    const userId2 = '2' + crypto.randomUUID();
    const kvInstance = getTypedKVInstance<TestKv>(COMMON);

    await kvInstance.users
      .userId(userId1)
      .put(testValue1, {metadata: testValue1});
    await kvInstance.users
      .userId(userId2)
      .put(testValue2, {metadata: testValue2});

    const roles = await kvInstance.users.list();
    expect(roles.keys.length).toEqual(2);
    expect(roles.keys[0].metadata).toEqual(testValue1);
    expect(roles.keys[1].metadata).toEqual(testValue2);
  });
});
