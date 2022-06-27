import {
  CheckDurableObjectMethods,
  DurableObjectWrapper,
} from '../../lib/durable-object-wrapper/durable-object-wrapper';
import { isNotNullOrUndefined } from '../../lib/lib';
import { LoggerContext } from '../../lib/middleware/context';
import { AuthenticationEnvironmentVariables } from './authentication-environment-variables';
import { AuthenticationKv, createAuthenticationKv } from './authentication-kv';

export class RolesStorage
  extends DurableObjectWrapper<AuthenticationEnvironmentVariables>
  implements CheckDurableObjectMethods<RolesStorage>
{
  public static readonly serviceName: string = 'authentication-roles-storage';

  constructor(
    private state: DurableObjectState,
    protected override readonly env: AuthenticationEnvironmentVariables,
  ) {
    super(RolesStorage.serviceName);
  }

  public async getRolesOfUser(
    { userId }: { userId: string },
    context: LoggerContext,
  ): Promise<string[]> {
    const authenticationKv = createAuthenticationKv(this.env.AUTHENTICATION);
    context.logger.info(`getting roles for userId=${userId}`);

    return await this.getRoles(authenticationKv, userId);
  }

  public async addRoleToUser(
    { userId, role }: { userId: string; role: string },
    context: LoggerContext,
  ): Promise<string> {
    const authenticationKv = createAuthenticationKv(this.env.AUTHENTICATION);
    context.logger.info(`Adding role to user. role=${role}`);
    await this.addRole(authenticationKv, userId, role);

    return role;
  }

  public async deleteRoleOfUser(
    { userId, role }: { userId: string; role: string },
    context: LoggerContext,
  ): Promise<string> {
    const authenticationKv = createAuthenticationKv(this.env.AUTHENTICATION);
    context.logger.info(`Deleting role from user. role=${role}`);

    await this.deleteRole(authenticationKv, userId, role);

    return role;
  }

  private async getRoles(
    authenticationKv: AuthenticationKv,
    userId: string,
  ): Promise<string[]> {
    const storageResult = await this.state.storage.get<string[]>(userId);
    if (isNotNullOrUndefined(storageResult)) {
      return storageResult;
    }
    const listResult = await authenticationKv.roles.userId(userId).list();
    const roles = listResult.keys.map((key) => key.metadata);
    await this.state.storage.put(userId, roles);
    return roles;
  }

  private async addRole(
    authenticationKv: AuthenticationKv,
    userId: string,
    role: string,
  ) {
    const roles: string[] = await this.getRoles(authenticationKv, userId);
    if (!roles.includes(role)) {
      roles.push(role);
    }
    await Promise.all([
      this.state.storage.put(userId, roles),
      authenticationKv.roles
        .userId(userId)
        .roleId(role)
        .put(role, { metadata: role }),
    ]);
  }

  private async deleteRole(
    authenticationKv: AuthenticationKv,
    userId: string,
    role: string,
  ) {
    const roles: string[] = (
      await this.getRoles(authenticationKv, userId)
    ).filter((it) => it !== role);
    await Promise.all([
      this.state.storage.put(userId, roles),
      authenticationKv.roles.userId(userId).roleId(role).delete(),
    ]);
  }
}
