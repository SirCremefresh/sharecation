import {CheckDurableObjectMethods, DurableObjectWrapper} from '../../lib/durable-object-wrapper/durable-object-wrapper';
import {isNotNullOrUndefined} from '../../lib/lib';
import {LoggerContext} from '../../lib/middleware/context';
import {TypedKvNamespace} from '../../lib/typed-kv-namespace';
import {AuthenticationEnvironmentVariables} from './authentication-environment-variables';
import {AUTHENTICATION_KV, createAuthenticationKv} from './authentication-kv';

export class RolesStorage extends DurableObjectWrapper<AuthenticationEnvironmentVariables> implements CheckDurableObjectMethods<RolesStorage> {
  public static readonly serviceName: string = 'authentication-roles-storage';

  constructor(
    private state: DurableObjectState,
    protected override readonly env: AuthenticationEnvironmentVariables,
  ) {
    super(RolesStorage.serviceName);
  }

  public async getRolesOfUser({userId}: { userId: string }, context: LoggerContext): Promise<string[]> {
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
    context.logger.info(`Adding role to user. role=${role}`);
    await this.addRole(authenticationKv, userId, role);

    return role;
  }

  public async deleteRoleOfUser({
                                  userId,
                                  role
                                }: { userId: string, role: string },
                                context: LoggerContext): Promise<string> {
    const authenticationKv = createAuthenticationKv(this.env.AUTHENTICATION);
    context.logger.info(`Deleting role from user. role=${role}`);

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
