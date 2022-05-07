import {CreateRoleBindingRequest} from '../../contracts/authentication/v1/authentication';
import {CreateGroupRequest, CreateGroupResponse, Group,} from '../../contracts/groups/v1/groups';
import {addAuthenticationGuard} from '../../lib/middleware/authenticated-middleware';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';
import {createProtoBufOkResponse, protoBuf,} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';
import {ROLES} from '../../lib/roles';
import {onFetch} from '../../lib/starter/on-fetch';

type Environement = {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
  PUBLIC_KEYS: string;
  SERVICE_ACCOUNT_KEY: string;
  COMMON: KVNamespace;
};

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<Environement>(
    addLoggerContext(
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
                try {
                  context.logger.info('Authorization: ' + `Bearer ${env.SERVICE_ACCOUNT_KEY}`)
                  const res = await fetch('https://sharecation-authentication-development.dowo.ch/v1/create-role-of-user', {
                    method: 'POST',
                    headers: {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json',
                      'Authorization': `Bearer ${env.SERVICE_ACCOUNT_KEY}`,
                    },
                    body: CreateRoleBindingRequest.toJsonString({
                      userId: context.user.userId,
                      role: ROLES.GROUP_MEMBER(crypto.randomUUID())
                    })
                  });
                  context.logger.info('res statuw' + res.status);
                  context.logger.info('res body' + await res.text());
                } catch (e) {
                  context.logger.error('Failed to create role binding', e);
                }

                return createProtoBufOkResponse<Group>({
                  groupId: '',
                  name: '',
                });
              },
            ),
          ),
        ),
      ]),
    ),
  )
};
