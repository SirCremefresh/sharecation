import {
  CreateGroupRequest,
  CreateGroupResponse,
  Group,
} from '../../contracts/groups/v1/groups';
import { addLoggerContext } from '../../lib/middleware/logger-middleware';
import {
  createProtoBufOkResponse,
  protoBuf,
} from '../../lib/middleware/protobuf-middleware';
import { addRouter, route } from '../../lib/middleware/router-middleware';
import { onFetch } from '../../lib/starter/on-fetch';

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<{
    LOKI_SECRET: string;
    ENVIRONMENT: string;
    PUBLIC_KEYS: string;
    COMMON: KVNamespace;
  }>(
    addLoggerContext(
      'groups',
      addRouter([
        route(
          'POST',
          [],
          protoBuf(
            CreateGroupRequest,
            CreateGroupResponse,
            async (request, env, context) => {
              return createProtoBufOkResponse<Group>({
                groupId: '',
                name: '',
              });
            },
          ),
        ),
      ]),
    ),
  ),
};
