import {TypedKvNamespace} from '../../lib/typed-kv-namespace';

const AUTHENTICATION_KV = {
  USERS_RIGHTS: 'USERS_RIGHTS:',
  USER_RIGHTS: (userId: string) => `${AUTHENTICATION_KV.USERS_RIGHTS}${userId}:`,
  USER_RIGHT: (userId: string, right: string) => `${AUTHENTICATION_KV.USER_RIGHTS(userId)}${right}`,
  GOOGLE_VERIFYING_JWKS: 'GOOGLE_VERIFYING_JWKS:',
  GOOGLE_VERIFYING_JWK: (kid: string) =>
    `${AUTHENTICATION_KV.GOOGLE_VERIFYING_JWKS}${kid}`,
  PRIVATE_JWKS: 'PRIVATE_JWKS:',
  PRIVATE_JWK: (kid: string) => `${AUTHENTICATION_KV.PRIVATE_JWKS}${kid}`,
  CURRENT_PRIVATE_JWK: 'CURRENT_PRIVATE_JWK',
};

export const createAuthenticationKv = (kv: KVNamespace) => new TypedKvNamespace(AUTHENTICATION_KV, kv);

export type AUTHENTICATION_KV = typeof AUTHENTICATION_KV;
