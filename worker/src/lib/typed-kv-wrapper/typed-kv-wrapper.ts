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
  const proxy = new Proxy({} as any, {
    get: function (_, method: string): any {
      if (path === '') {
        path = method + ':';
        return proxy;
      }
      switch (method) {
        case 'get':
          return () => kvNamespace.get(path);
        case 'put':
          return (entity: any, options: any) => kvNamespace.put(path, JSON.stringify(entity), options);
        case 'list':
          return (options?: { limit?: number, cursor?: string }) => kvNamespace.list({
            cursor: options?.cursor,
            limit: options?.limit,
            prefix: path
          });
        default:
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
