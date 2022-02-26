import {AuthenticatedContext} from './middleware/context';

export const RIGHTS = {
  GROUP: (groupId: string) => `groups:${groupId}`,
  ADMIN_GROUP: 'admin:groups',
};

export function hasRight(right: string, context: AuthenticatedContext): boolean {
  return context.user.rights.has(right);
}

export function getRights(context: AuthenticatedContext): string[] {
  return Array.from(context.user.rights);
}
