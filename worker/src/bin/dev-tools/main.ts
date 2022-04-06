import {
  CreateUserRequest,
  CreateUserResponse,
  User,
} from '../../contracts/dev-tools/v1/jwt';
import { addGuard } from '../../lib/middleware/guard-middleware';
import { addLoggerContext } from '../../lib/middleware/logger-middleware';
import {
  createProtoBufOkResponse,
  protoBuf,
} from '../../lib/middleware/protobuf-middleware';
import { addRouter, route } from '../../lib/middleware/router-middleware';
import { onFetch } from '../../lib/starter/on-fetch';
import { createAuthenticationKv } from '../authentication/authentication-kv';
import { generateSharecationJwt } from '../authentication/sharecation-keys';

type EnvironmentVariables = {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
  COMMON: KVNamespace;
  AUTHENTICATION: KVNamespace;
};

// noinspection JSUnusedGlobalSymbols
export default {
  fetch: onFetch<EnvironmentVariables>(
    addLoggerContext(
      'dev-tools',
      addGuard(
        (_request, env, _context) => env.ENVIRONMENT === 'development',
        addRouter([
          route(
            'POST',
            ['v1', 'create-user'],
            protoBuf(
              CreateUserRequest,
              CreateUserResponse,
              async (request, env, context) => {
                const authenticationKv = createAuthenticationKv(
                  env.AUTHENTICATION,
                );
                const userId = crypto.randomUUID();
                const jwtData = await generateSharecationJwt(
                  userId,
                  context.proto.body.rights,
                  authenticationKv,
                  context,
                );
                return createProtoBufOkResponse<User>({
                  userId,
                  jwtString: jwtData.jwtString,
                });
              },
            ),
          ),
        ]),
      ),
    ),
  ),
};
