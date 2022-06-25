import {TypedKvNamespace} from '../../lib/typed-kv-namespace';

const AUTHENTICATION_KV = {
  USERS_ROLES: 'USERS_ROLES:',
  USER_ROLES: (userId: string) =>
    `${AUTHENTICATION_KV.USERS_ROLES}${userId}:`,
  USER_ROLE: (userId: string, role: string) =>
    `${AUTHENTICATION_KV.USER_ROLES(userId)}${role}`,
  GOOGLE_VERIFYING_JWKS: 'GOOGLE_VERIFYING_JWKS:',
  GOOGLE_VERIFYING_JWK: (kid: string) =>
    `${AUTHENTICATION_KV.GOOGLE_VERIFYING_JWKS}${kid}`,
  PRIVATE_JWKS: 'PRIVATE_JWKS:',
  PRIVATE_JWK: (kid: string) => `${AUTHENTICATION_KV.PRIVATE_JWKS}${kid}`,
  PUBLIC_JWKS: 'PUBLIC_JWKS:',
  PUBLIC_JWK: (kid: string) => `${AUTHENTICATION_KV.PUBLIC_JWKS}${kid}`,
  CURRENT_PUBLIC_JWKS: 'CURRENT_PUBLIC_JWKS',
  CURRENT_PRIVATE_JWK: 'CURRENT_PRIVATE_JWK',
  NEXT_PRIVATE_JWK: 'NEXT_PRIVATE_JWK',
};


export const createAuthenticationKv = (kv: KVNamespace) =>
  new TypedKvNamespace(AUTHENTICATION_KV, kv);

export type AUTHENTICATION_KV = typeof AUTHENTICATION_KV;
