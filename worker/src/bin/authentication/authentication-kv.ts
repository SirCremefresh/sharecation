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

type MutateKvEntity<ENTITY, META extends {} | void> = META extends void ? {
  put: (entity: ENTITY, options?: KVPutOptions<META>) => Promise<void>
  get: () => Promise<ENTITY>
  delete: () => Promise<void>
  getWithMetadata: () => Promise<KVValueMeta<ENTITY, META>>
} : {
  put: (entity: ENTITY, options: KVPutOptions<META>) => Promise<void>
  get: () => Promise<ENTITY>
  delete: () => Promise<void>
  getWithMetadata: () => Promise<KVValueMeta<ENTITY, META>>
};
type NestedMULTIPLEKVKey<PARAMETERS extends string[], ENTITY, META extends {} | void = void> = PARAMETERS extends [infer CURRENT_PARAMETER extends string, ...infer REST extends string[]] ?
  {
    [key in CURRENT_PARAMETER]:
    (variable: string) => REST extends [] ? MutateKvEntity<ENTITY, META> : NestedMULTIPLEKVKey<REST, ENTITY, META>
  } & { list: () => Promise<KVListResult<META>> }
  :
  MutateKvEntity<ENTITY, META>


type NestedGetKVKey<PARAMETERS extends string[], ENTITY> = PARAMETERS extends [infer CURRENT_PARAMETER extends string, ...infer REST extends string[]] ?
  {
    [key in CURRENT_PARAMETER]:
    (variable: string) => REST extends [] ? Promise<ENTITY> : NestedGetKVKey<REST, ENTITY>
  } & { list: () => Promise<ENTITY[]> }
  :
  () => Promise<ENTITY>

type NestedSetKVKey<PARAMETERS extends string[], ENTITY> = PARAMETERS extends [infer CURRENT_PARAMETER extends string, ...infer REST extends string[]] ?
  {
    [key in CURRENT_PARAMETER]:
    REST extends [] ? (variable: string, entity: ENTITY) => Promise<void> : (variable: string) => NestedSetKVKey<REST, ENTITY>
  }
  :
  (entity: ENTITY) => Promise<void>


type KVKey<ENTITY> = {
  get: NestedGetKVKey<[], ENTITY>
  set: NestedSetKVKey<[], ENTITY>
}

type NestedKVKey<PARAMETERS extends string[], ENTITY> = {
  get: NestedGetKVKey<PARAMETERS, ENTITY>
  set: NestedSetKVKey<PARAMETERS, ENTITY>
}


interface TestKv {
  test: NestedMULTIPLEKVKey<['userId'], { firstNameE: string }>;
  testWithMeta: NestedMULTIPLEKVKey<['userId'], { firstNameE: string }, { last: string }>;


  roles: NestedKVKey<['userId', 'roleId'], { firstName: string }>;
  rosles: NestedKVKey<['user', 'userId', 'asdfdds'], string>;
  sdfsd: NestedKVKey<['user', 'userId'], string>;
  privateKey: KVKey<string>;
}

declare const a: TestKv;


console.log(a.test.userId('ads').put({firstNameE: 'asdf'}, {expiration: 'asd'}));
console.log(a.testWithMeta.userId('ads').put({firstNameE: 'asdf'}, {expiration: 'asd', metadata: {last: 'sd'}}));
console.log(a.test.userId('ads').put({firstNameE: 'asdf'}));
console.log(a.test.userId('ads'));

let b3: { firstName: string } = await a.roles.get.userId('as').roleId('asdf');
let b4: { firstName: string }[] = await a.roles.get.userId('as').list();
await a.roles.set.userId('asdf').roleId('asd', {firstName: 'asdfsd'});
let b6: string[] = await a.sdfsd.get.list();
let b5: string = await a.privateKey.get();
await a.privateKey.set('asdf');

console.log(b3, b4, b5, b6);

// let v1: string = await a.roles['some-user-id']['group-id']();
// let v2: string[] = await a.roles['some-user-id']();

export const createAuthenticationKv = (kv: KVNamespace) =>
  new TypedKvNamespace(AUTHENTICATION_KV, kv);

export type AUTHENTICATION_KV = typeof AUTHENTICATION_KV;
