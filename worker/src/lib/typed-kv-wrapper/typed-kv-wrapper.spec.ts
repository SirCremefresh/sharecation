import {expect, test} from '@jest/globals';
import {getTypedKVInstance, KVKey, NestedKVKey} from './typed-kv-wrapper';

interface TestKv {
  roles: NestedKVKey<['userId', 'roleId'], { roleName: string }>;
  privateKey: KVKey<string>;
}

declare const getMiniflareBindings: () => { [key: string]: KVNamespace };
const {COMMON} = getMiniflareBindings();

test('put on kvKey', async () => {
  const testValue = 'some-private-key';
  const kvInstance = getTypedKVInstance<TestKv>(COMMON);
  await kvInstance.privateKey.put(testValue);
  expect(await COMMON.get('privateKey:')).toEqual(testValue);
});

test('put on nestedKvKey', async () => {
  const testValue = {roleName: 'some-role-name'};
  const kvInstance = getTypedKVInstance<TestKv>(COMMON);
  await kvInstance.roles.userId('some-user-id').roleId('some-role-id').put(testValue);
  expect(await COMMON.get('roles:userId:some-user-id:roleId:some-role-id:','json')).toEqual(testValue);
});
