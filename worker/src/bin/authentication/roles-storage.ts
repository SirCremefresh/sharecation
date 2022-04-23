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

const SERVICE_NAME = 'authentication-roles-storage';

export class RolesStorage {
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
          ['v1', pathParam('userId'), 'roles'],
          async (request, env, context) => {
            const userId = context.route.params.userId;
            context.logger.info(`getting roles for userId=${userId}`);
            const authenticationKv = createAuthenticationKv(env.AUTHENTICATION);

            const roles = await this.getRoles(authenticationKv, userId);

            return new Response(JSON.stringify(roles), {
              headers: {
                'content-type': 'application/json',
              },
            });
          },
        ),
        route(
          'POST',
          ['v1', pathParam('userId'), 'roles'],
          async (request, env, context) => {
            const userId = context.route.params.userId;
            const { role } = await request.json<{ role: string }>();
            const authenticationKv = createAuthenticationKv(env.AUTHENTICATION);

            await this.addRole(authenticationKv, userId, role);

            return new Response(JSON.stringify({ role }), {
              headers: {
                'content-type': 'application/json',
              },
            });
          },
        ),
        route(
          'DELETE',
          ['v1', pathParam('userId'), 'roles', pathParam('role')],
          async (request, env, context) => {
            const userId = context.route.params.userId;
            const role = context.route.params.role;
            const authenticationKv = createAuthenticationKv(env.AUTHENTICATION);

            await this.deleteRole(authenticationKv, userId, role);

            return new Response(JSON.stringify({ role }), {
              headers: {
                'content-type': 'application/json',
              },
            });
          },
        ),
      ]),
    ),
  );

  private async getRoles(
    authenticationKv: TypedKvNamespace<AUTHENTICATION_KV>,
    userId: string,
  ): Promise<string[]> {
    const key = authenticationKv.keys.USER_ROLES(userId);
    const storageResult = await this.state.storage.get<string[]>(key);
    if (isNotNullOrUndefined(storageResult)) {
      return storageResult;
    }
    const listResult = await authenticationKv.namespace.list<string>({
      prefix: key,
    });
    const roles = listResult.keys.map((key) => key.metadata) as string[];
    await this.state.storage.put(key, roles);
    return roles;
  }

  private async addRole(
    authenticationKv: TypedKvNamespace<AUTHENTICATION_KV>,
    userId: string,
    role: string,
  ) {
    const rolesKey = authenticationKv.keys.USER_ROLES(userId);
    const roleKey = authenticationKv.keys.USER_ROLE(userId, role);
    const roles: string[] = await this.getRoles(authenticationKv, userId);
    if (!roles.includes(role)) {
      roles.push(role);
    }
    await Promise.all([
      this.state.storage.put(rolesKey, roles),
      authenticationKv.namespace.put(roleKey, role, { metadata: role }),
    ]);
  }

  private async deleteRole(
    authenticationKv: TypedKvNamespace<AUTHENTICATION_KV>,
    userId: string,
    role: string,
  ) {
    const key = authenticationKv.keys.USER_ROLE(userId, role);
    await Promise.all([
      this.state.storage.delete(key),
      authenticationKv.namespace.delete(key),
    ]);
  }
}
