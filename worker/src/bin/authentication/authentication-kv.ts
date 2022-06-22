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

type NestedKVKey<PARAMETERS extends string[], ENTITY> = PARAMETERS extends [infer CURRENT_PARAMETER extends string, ...infer REST extends string[]] ?
  {
    [key in CURRENT_PARAMETER]:
    (variable: string) => REST extends [] ? Promise<ENTITY> : NestedKVKey<REST, ENTITY> & Promise<ENTITY[]>
  } & (() => Promise<ENTITY[]>)
  :
  () => Promise<ENTITY>


// type NestedKVKey<PARAMETERS extends string[], ENTITY> = PARAMETERS extends [infer CURRENT_PARAMETER extends string, ...infer REST extends string[]] ?
//   CURRENT_PARAMETER extends `${infer CURRENT_PARAMETER_FUNCTION_NAME extends string}()` ?
//     {
//       [key in CURRENT_PARAMETER_FUNCTION_NAME]:
//       (variable: string) => REST extends [] ? Promise<ENTITY> : NestedKVKey<REST, ENTITY> & Promise<ENTITY[]>
//     }
//     :
//     {
//       [key in CURRENT_PARAMETER]: (() => Promise<ENTITY[]>) // &  NestedKVKey<REST, ENTITY>
//
//     }
//   :
//   () => Promise<ENTITY>


type KVKey<ENTITY> = NestedKVKey<[], ENTITY>

// type Func<E extends KvKeyLALA[], ENTITY> = E extends [infer A, ...infer C extends string[]] ?
//   A extends string ?
//     {
//       [key in A]: Func<C, ENTITY>
//     }
//     : never :
//   AsyncFunc<ENTITY>


interface TestKv {
  // roles: {
  //   [userId: string]: {
  //     [roleId: string]: AsyncFunc<string>
  //   } & AsyncFunc<string[]>
  // } & AsyncFunc<string[]>;

  roles: NestedKVKey<['userId', 'roleId'], string>;
  rosles: NestedKVKey<['user', 'userId', 'asdfdds'], string>;
  sdfsd: NestedKVKey<['user', 'userId'], string>;
  privateKey: KVKey<string>;
}

declare const a: TestKv;

let b3: string = await a.roles.userId('as').roleId('asdf');
let b4: string[] = await a.roles.userId('as');
let b6: string[] = await a.sdfsd();
let b5: string = await a.privateKey();

console.log(b3, b4, b5, b6);

// let v1: string = await a.roles['some-user-id']['group-id']();
// let v2: string[] = await a.roles['some-user-id']();

export const createAuthenticationKv = (kv: KVNamespace) =>
  new TypedKvNamespace(AUTHENTICATION_KV, kv);

export type AUTHENTICATION_KV = typeof AUTHENTICATION_KV;
