import { AuthenticatedContext } from './middleware/context';

export const ROLES = {
  GROUP: (groupId: string) => `groups:${groupId}`,
  ADMIN_GROUP: 'admin:groups',
  ADMIN_ROLE: 'admin:roles',
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
