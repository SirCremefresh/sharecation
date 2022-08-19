import {getTypedKVInstance, NestedKVKey} from '../../lib/typed-kv-wrapper/typed-kv-wrapper';

export const GROUPS_KV = {
  GROUP: (groupId: string) => `${GROUPS_KV.GROUPS}${groupId}:`,
  GROUPS: 'groups:',
};

export interface GroupKv {
  name: string;
  groupId: string;
  createdAt: string;
}

export interface GroupsKv {
  groups: NestedKVKey<['groupId'], GroupKv>;
}

export const createGroupsKv = (kv: KVNamespace) =>
  getTypedKVInstance<GroupsKv>(kv);
