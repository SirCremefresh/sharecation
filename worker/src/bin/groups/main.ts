import {CreateGroupRequest, CreateGroupResponse, Group} from '../../contracts/groups/v1/groups';
import {addLoggerContext} from '../../lib/middleware/logger-middleware';
import {createProtoBufOkResponse, protoBuf} from '../../lib/middleware/protobuf-middleware';
import {addRouter, route} from '../../lib/middleware/router-middleware';

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: addLoggerContext<{ LOKI_SECRET: string; ENVIRONMENT: string, COMMON: KVNamespace }>(
    'groups',
    addRouter([
      route(
        'POST',
        [],
        protoBuf(
          CreateGroupRequest, CreateGroupResponse,
          async (request, env, context) => {
            return createProtoBufOkResponse<Group>({
              groupId: '',
              name: ''
            });
          }
        )
      )
    ])
  )
};
