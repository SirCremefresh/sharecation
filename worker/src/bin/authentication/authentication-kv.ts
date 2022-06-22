import {KVListResult, KVNamespace, KVPutOptions, KVValueMeta} from '@miniflare/kv';
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

type MutateKvEntity<ENTITY, META extends {} | void> = {
  put: META extends void ?
    (entity: ENTITY, options?: KVPutOptions<META>) => Promise<void> :
    (entity: ENTITY, options: KVPutOptions<META>) => Promise<void>
  get: () => Promise<ENTITY>
  delete: () => Promise<void>
  getWithMetadata: () => Promise<KVValueMeta<ENTITY, META>>
};
type NestedKVKey<PARAMETERS extends string[], ENTITY, META extends {} | void = void> =
  PARAMETERS extends [infer CURRENT_PARAMETER extends string, ...infer REST extends string[]] ?
    {
      [key in CURRENT_PARAMETER]:
      (variable: string) => REST extends [] ?
        MutateKvEntity<ENTITY, META> :
        NestedKVKey<REST, ENTITY, META>
    } & { list: () => Promise<KVListResult<META>> }
    :
    MutateKvEntity<ENTITY, META>

type KVKey<ENTITY, META extends {} | void = void> = NestedKVKey<[], ENTITY, META>

interface TestKv {
  roles: NestedKVKey<['userId', 'roleId'], { firstName: string }, { last: string }>;
  privateKey: KVKey<string>;
}

declare const a: TestKv;


let b3: { firstName: string } = await a.roles.userId('as').roleId('asdf').get();
let b4: KVListResult<{ last: string }> = await a.roles.userId('as').list();
await a.roles.userId('asdf').roleId('asd').put({firstName: 'asdfsd'}, {metadata: {last: 'dds'}});
let b5: string = await a.privateKey.get();
await a.privateKey.put('asdf');
//
console.log(b3, b4, b5);

// let v1: string = await a.roles['some-user-id']['group-id']();
// let v2: string[] = await a.roles['some-user-id']();

export const createAuthenticationKv = (kv: KVNamespace) =>
  new TypedKvNamespace(AUTHENTICATION_KV, kv);

export type AUTHENTICATION_KV = typeof AUTHENTICATION_KV;
