import {isNotNullOrUndefined} from '../../lib/lib';
import {LoggerContext, RequestIdContext} from '../../lib/middleware/context';
import {addLoggerContext, LoggerConfig} from '../../lib/middleware/logger-middleware';
import {onDurableObjectFetch} from '../../lib/starter/on-durable-object-fetch';
import {TypedKvNamespace} from '../../lib/typed-kv-namespace';
import {AuthenticationEnvironmentVariables} from './authentication-environment-variables';
import {AUTHENTICATION_KV, createAuthenticationKv} from './authentication-kv';

const SERVICE_NAME = 'authentication-roles-storage';

type Invalid<T> = T & Error;
type DurableObjectMethod = (body: any, context: RequestIdContext & LoggerContext) => Promise<any>;
type CheckDurableObjectMethods<T> = {
  [K in keyof T]: T[K] extends Function ?
    K extends 'fetch' ? T[K] :
      (T[K] extends DurableObjectMethod ? T[K] :
        Invalid<['method is not valid. name: ', K]>) : T[K]
}


export abstract class DoWrapper<Env extends LoggerConfig> implements DurableObject {
  protected abstract env: Env;
  fetch = onDurableObjectFetch<Env>(
    () => this.env,
    addLoggerContext(
      SERVICE_NAME,
      async (request, env, context) => {
        const path = new URL(request.url).pathname;
        const methodName = path.startsWith('/') ? path.substring(1) : path;
        const parameters = await request.json<unknown>();
        const callableThis = this as any;
        try {
          const result = await callableThis[methodName](parameters, context);
          return new Response(JSON.stringify(result), {
            status: 200,
            headers: {
              'content-type': 'application/json',
            },
          });
        } catch (error) {
          context.logger.error('An error occurred in durable object', error);
          return new Response(JSON.stringify({reason: 'unknown'}), {
            status: 500,
            headers: {
              'content-type': 'application/json',
            },
          });
        }
      }
    ),
  );
}

export class RolesStorage extends DoWrapper<AuthenticationEnvironmentVariables> implements CheckDurableObjectMethods<RolesStorage> {
  constructor(
    private state: DurableObjectState,
    protected override readonly env: AuthenticationEnvironmentVariables,
  ) {
    super();
  }

  public async getRolesOfUser({userId}: {userId: string}, context: LoggerContext): Promise<string[]> {
    const authenticationKv = createAuthenticationKv(this.env.AUTHENTICATION);
    context.logger.info(`getting roles for userId=${userId}`);

    return await this.getRoles(authenticationKv, userId);
  }

  public async addRoleToUser({
                               userId,
                               role
                             }: { userId: string, role: string },
                             context: LoggerContext): Promise<string> {
    const authenticationKv = createAuthenticationKv(this.env.AUTHENTICATION);

    await this.addRole(authenticationKv, userId, role);

    return role;
  }

  public async deleteRoleOfUser({
                                  userId,
                                  role
                                }: { userId: string, role: string },
                                context: LoggerContext): Promise<string> {
    const authenticationKv = createAuthenticationKv(this.env.AUTHENTICATION);

    await this.deleteRole(authenticationKv, userId, role);

    return role;
  }

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
      authenticationKv.namespace.put(roleKey, role, {metadata: role}),
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
