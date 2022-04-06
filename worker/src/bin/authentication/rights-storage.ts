import { isNotNullOrUndefined } from '../../lib/lib';
import { addLoggerContext } from '../../lib/middleware/logger-middleware';
import {
  addRouter,
  pathParam,
  route,
} from '../../lib/middleware/router-middleware';
import { onDurableObjectFetch } from '../../lib/starter/on-durable-object-fetch';
import { TypedKvNamespace } from '../../lib/typed-kv-namespace';
import { AuthenticationEnvironmentVariables } from './authentication-environment-variables';
import { AUTHENTICATION_KV, createAuthenticationKv } from './authentication-kv';

const SERVICE_NAME = 'authentication-rights-storage';

export class RightsStorage {
  constructor(
    private state: DurableObjectState,
    private readonly env: AuthenticationEnvironmentVariables,
  ) {}

  fetch = onDurableObjectFetch<AuthenticationEnvironmentVariables>(
    () => this.env,
    addLoggerContext(
      SERVICE_NAME,
      addRouter([
        route(
          'GET',
          ['v1', pathParam('userId'), 'rights'],
          async (request, env, context) => {
            const userId = context.route.params.userId;
            context.logger.info(`getting rights for userId=${userId}`);
            const authenticationKv = createAuthenticationKv(env.AUTHENTICATION);

            const rights = await this.getRights(authenticationKv, userId);

            return new Response(JSON.stringify(rights), {
              headers: {
                'content-type': 'application/json',
              },
            });
          },
        ),
        route(
          'POST',
          ['v1', pathParam('userId'), 'rights'],
          async (request, env, context) => {
            const userId = context.route.params.userId;
            const { right } = await request.json<{ right: string }>();
            const authenticationKv = createAuthenticationKv(env.AUTHENTICATION);

            await this.addRight(authenticationKv, userId, right);

            return new Response(JSON.stringify({ right }), {
              headers: {
                'content-type': 'application/json',
              },
            });
          },
        ),
        route(
          'DELETE',
          ['v1', pathParam('userId'), 'rights', pathParam('right')],
          async (request, env, context) => {
            const userId = context.route.params.userId;
            const right = context.route.params.right;
            const authenticationKv = createAuthenticationKv(env.AUTHENTICATION);

            await this.deleteRight(authenticationKv, userId, right);

            return new Response(JSON.stringify({ right }), {
              headers: {
                'content-type': 'application/json',
              },
            });
          },
        ),
      ]),
    ),
  );

  private async getRights(
    authenticationKv: TypedKvNamespace<AUTHENTICATION_KV>,
    userId: string,
  ): Promise<string[]> {
    const key = authenticationKv.keys.USER_RIGHTS(userId);
    const storageResult = await this.state.storage.get<string[]>(key);
    if (isNotNullOrUndefined(storageResult)) {
      return storageResult;
    }
    const listResult = await authenticationKv.namespace.list<string>({
      prefix: key,
    });
    const rights = listResult.keys.map((key) => key.metadata) as string[];
    await this.state.storage.put(key, rights);
    return rights;
  }

  private async addRight(
    authenticationKv: TypedKvNamespace<AUTHENTICATION_KV>,
    userId: string,
    right: string,
  ) {
    const rightsKey = authenticationKv.keys.USER_RIGHTS(userId);
    const rightKey = authenticationKv.keys.USER_RIGHT(userId, right);
    const rights: string[] = await this.getRights(authenticationKv, userId);
    if (!rights.includes(right)) {
      rights.push(right);
    }
    await Promise.all([
      this.state.storage.put(rightsKey, rights),
      authenticationKv.namespace.put(rightKey, right, { metadata: right }),
    ]);
  }

  private async deleteRight(
    authenticationKv: TypedKvNamespace<AUTHENTICATION_KV>,
    userId: string,
    right: string,
  ) {
    const key = authenticationKv.keys.USER_RIGHT(userId, right);
    await Promise.all([
      this.state.storage.delete(key),
      authenticationKv.namespace.delete(key),
    ]);
  }
}
