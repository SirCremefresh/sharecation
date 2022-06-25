import {describe, expect, test} from '@jest/globals';
import {getTypedKVInstance, KVKey, NestedKVKey} from './typed-kv-wrapper';

interface TestKv {
  roles: NestedKVKey<['userId', 'roleId'], { roleName: string }>;
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
    await kvInstance.roles.userId('some-user-id').roleId('some-role-id').put(testValue);
    expect(await COMMON.get('roles:userId:some-user-id:roleId:some-role-id:', 'json')).toEqual(testValue);
  });

  test('get on nestedKvKey', async () => {
    const testValue = {roleName: crypto.randomUUID()};
    const kvInstance = getTypedKVInstance<TestKv>(COMMON);
    await COMMON.put('roles:userId:some-user-id:roleId:some-role-id:', JSON.stringify(testValue));
    expect(await kvInstance.roles.userId('some-user-id').roleId('some-role-id').get()).toEqual(testValue);
  });

});
