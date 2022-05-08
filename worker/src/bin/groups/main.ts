import {CreateRoleBindingRequest, CreateRoleBindingResponse} from '../../contracts/authentication/v1/authentication';
import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {
  CreateGroupRequest,
  CreateGroupResponse,
  GetGroupsResponse,
  Group,
  Groups,
} from '../../contracts/groups/v1/groups';
import {callApi} from '../../lib/api';
import {isNotNullOrUndefined} from '../../lib/lib';
import {addAuthenticationGuard} from '../../lib/middleware/authenticated-middleware';
import {
  createProtoBufBasicErrorResponse,
  createProtoBufOkResponse,
  protoBuf,
} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {ROLES} from '../../lib/roles';
import {onFetch} from '../../lib/starter/on-fetch';
import {TypedKvNamespace} from '../../lib/typed-kv-namespace';
import {GROUPS_KV} from './groups-kv';

type Environment = {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
  PUBLIC_KEYS: string;
  SERVICE_ACCOUNT_KEY: string;
  GROUPS: KVNamespace;
};

function addGroupRoleBinding(serviceAccount: string, userId: string, newGroupId: string, context: {}) {
  return callApi(
    CreateRoleBindingRequest,
    CreateRoleBindingResponse,
    {
      userId,
      role: ROLES.GROUP_MEMBER(newGroupId)
    },
    serviceAccount,
    'authentication',
    'development',
    '/v1/create-role-binding',
    context
  );
}

interface GroupKv {
  name: string,
  groupId: string,
  createdAt: string
}

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<Environment>(
    'groups',
    addAuthenticationGuard(
      addRouter([
        route(
          'POST',
          ['v1', 'create-group'],
          protoBuf(
            CreateGroupRequest,
            CreateGroupResponse,
            async (request, env, context) => {
              const newGroupId = crypto.randomUUID();
              const userId = context.user.userId;

              const response = await addGroupRoleBinding(env.SERVICE_ACCOUNT_KEY, userId, newGroupId, context);
              if (response.oneofKind !== 'ok') {
                context.logger.error(`Failed to create group role binding for groupId=${newGroupId} and userId=${userId}`);
                return createProtoBufBasicErrorResponse('Failed to create group role binding', BasicError_BasicErrorCode.INTERNAL);
              }

              const groupsKv = new TypedKvNamespace(GROUPS_KV, env.GROUPS);
              const value: GroupKv = {
                createdAt: new Date().toISOString(),
                groupId: newGroupId,
                name: context.proto.body.name,
              };
              await groupsKv.namespace.put(groupsKv.keys.GROUP(newGroupId), JSON.stringify(value));

              return createProtoBufOkResponse<Group>({
                groupId: newGroupId,
                name: context.proto.body.name,
              });
            },
          ),
        ),
        route(
          'POST',
          ['v1', 'get-groups'],
          protoBuf(
            null,
            GetGroupsResponse,
            async (request, env, context) => {
              const groupsKv = new TypedKvNamespace(GROUPS_KV, env.GROUPS);

              const groupsPromises = Array.from(context.user.roles)
                .filter(role => role.startsWith(ROLES.GROUPS))
                .map(role => role.split(':')[1] as string)
                .map(groupId => groupsKv.namespace.get<GroupKv>(groupsKv.keys.GROUP(groupId), 'json'));


              const groups: Group[] = (await Promise.all(groupsPromises))
                .filter(isNotNullOrUndefined)
                .map(group => ({
                  groupId: group.groupId,
                  name: group.name,
                }));


              return createProtoBufOkResponse<Groups>({
                groups
              });
            },
          ),
        ),
      ]),
    ),
  ),
};
