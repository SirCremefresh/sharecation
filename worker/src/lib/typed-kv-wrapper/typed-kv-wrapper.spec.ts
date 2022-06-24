import {expect, test} from '@jest/globals';
import {getTypedKVInstance, KVKey, NestedKVKey} from './typed-kv-wrapper';

interface TestKv {
  roles: NestedKVKey<['userId', 'roleId'], { firstName: string }>;
  privateKey: KVKey<string>;
}

declare const getMiniflareBindings: () => { [key: string]: KVNamespace };
const {COMMON} = getMiniflareBindings();

test('sign key', async () => {
  const kvInstance = getTypedKVInstance<TestKv>(COMMON);
  await kvInstance.privateKey.put('hello');
  expect(await COMMON.get('privateKey:')).toEqual('hello');
});
