import {CreateRoleBindingRequest, CreateRoleBindingResponse} from '../../contracts/authentication/v1/authentication';
import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {CreateGroupRequest, CreateGroupResponse, Group,} from '../../contracts/groups/v1/groups';
import {callApi} from '../../lib/api';
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

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<Environment>(
    'groups',
    addRouter([
      route(
        'POST',
        ['v1', 'create-group'],
        addAuthenticationGuard(
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
              await groupsKv.namespace.put(groupsKv.keys.GROUP(newGroupId), JSON.stringify({
                createdAt: new Date().toISOString(),
                groupId: newGroupId,
                name: context.proto.body.name,
              }));

              return createProtoBufOkResponse<Group>({
                groupId: newGroupId,
                name: context.proto.body.name,
              });
            },
          ),
        ),
      ),
    ]),
  ),
};
