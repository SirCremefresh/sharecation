export const AUTHENTICATION_KV = {
  USERS_RIGHTS: 'USERS_RIGHTS:',
  USER_RIGHTS: (userId: string) => `${AUTHENTICATION_KV.USERS_RIGHTS}${userId}:`,
  USER_RIGHT: (userId: string, right: string) => `${AUTHENTICATION_KV.USER_RIGHTS(userId)}${right}`,
};
