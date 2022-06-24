interface KVNamespacePutOptionsTyped<Metadata> extends KVNamespacePutOptions {
  expiration?: number;
  expirationTtl?: number;
  metadata: Metadata;
}

type AccessKvEntity<ENTITY, META extends {} | void> = {
  put: META extends void ?
    (entity: ENTITY, options?: KVNamespacePutOptions) => Promise<void> :
    (entity: ENTITY, options: KVNamespacePutOptionsTyped<META>) => Promise<void>
  get: () => ENTITY,
  delete: () => Promise<void>
  getWithMetadata: () => Promise<KVNamespaceGetWithMetadataResult<ENTITY, META>>
};
type ListKvEntity<META extends {} | void = void> = { list: () => Promise<KVNamespaceListResult<META>> };

export type NestedKVKey<PARAMETERS extends string[], ENTITY, META extends {} | void = void> =
  PARAMETERS extends [infer CURRENT_PARAMETER extends string, ...infer REST extends string[]] ?
    {
      [key in CURRENT_PARAMETER]:
      (variable: string) => REST extends [] ?
        AccessKvEntity<ENTITY, META> :
        NestedKVKey<REST, ENTITY, META>
    } & ListKvEntity<META>
    :
    AccessKvEntity<ENTITY, META>

export type KVKey<ENTITY, META extends {} | void = void> = NestedKVKey<[], ENTITY, META>


function recursiveProxy(kvNamespace: KVNamespace<string>) {
  let path = '';
  const proxy = new Proxy({} as unknown as any, {
    get(_, method: string): any {
      if (method === 'get') {
        return () => kvNamespace.get(path);
      } else if (method === 'put') {
        return () => kvNamespace.get(path);
      } else if (method === 'list') {
        return (options?: KVNamespaceListOptions) => kvNamespace.list(options);
      } else {
        return (variable: string) => {
          path += method + ':' + variable + ':';
          return proxy;
        };
      }
    }
  });
  return proxy;
}

export function getTypedKVInstance<KV extends {}>(
  kvNamespace: KVNamespace): KV {
  return recursiveProxy(kvNamespace);
}
