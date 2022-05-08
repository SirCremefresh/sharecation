import {AuthenticatedContext} from './middleware/context';

export const ROLES = {
  GROUP_MEMBER: (groupId: string) => `${ROLES.GROUPS}${groupId}:member`,
  GROUPS: `groups:`,
  ADMIN_ROLES_READ: 'admin:roles:read',
  ADMIN_ROLES_WRITE: 'admin:roles:write',
  ADMIN_ROLES_DELETE: 'admin:roles:delete',
};

export function hasRole(
  role: string,
  context: AuthenticatedContext,
): boolean {
  return context.user.roles.has(role);
}

export function getRoles(context: AuthenticatedContext): string[] {
  return Array.from(context.user.roles);
}
