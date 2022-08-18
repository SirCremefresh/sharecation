import {getTypedKVInstance, KVKey, NestedKVKey,} from '../../lib/typed-kv-wrapper/typed-kv-wrapper';

export interface AuthenticationKv {
  roles: NestedKVKey<['userId', 'roleId'], string, string>;
  nextPrivateJWK: KVKey<JsonWebKey & { kid: string }>;
  currentPrivateJWK: KVKey<JsonWebKey & { kid: string }>;
  currentPublicJWKS: KVKey<Array<JsonWebKey & { kid: string }>>;
  googleVerifyingJWKS: NestedKVKey<['kid'], JsonWebKey>;
  publicJWKS: NestedKVKey<['kid'], JsonWebKey & { kid: string }>;
  privateJWKS: NestedKVKey<['kid'], JsonWebKey & { kid: string }>;
}

export const createAuthenticationKv = (kv: KVNamespace) =>
  getTypedKVInstance<AuthenticationKv>(kv);
