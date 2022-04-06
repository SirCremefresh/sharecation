import { TypedKvNamespace } from './typed-kv-namespace';

const COMMON_KV = {};

export const createCommonKv = (kv: KVNamespace) =>
  new TypedKvNamespace(COMMON_KV, kv);

export type COMMON_KV = typeof COMMON_KV;
