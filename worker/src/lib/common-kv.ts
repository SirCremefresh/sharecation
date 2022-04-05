import { TypedKvNamespace } from './typed-kv-namespace';

const COMMON_KV = {
  PUBLIC_JWKS: 'PUBLIC_JWKS:',
  PUBLIC_JWK: (kid: string) => `${COMMON_KV.PUBLIC_JWKS}${kid}`,
};

export const createCommonKv = (kv: KVNamespace) =>
  new TypedKvNamespace(COMMON_KV, kv);

export type COMMON_KV = typeof COMMON_KV;
