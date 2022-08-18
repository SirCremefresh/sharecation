import {assertNotNullOrUndefined} from '../lib';

interface KVNamespacePutOptionsTyped<Metadata> extends KVNamespacePutOptions {
  expiration?: number;
  expirationTtl?: number;
  metadata: Metadata;
}

interface KVNamespaceListResultTyped<Metadata>
  extends KVNamespaceListResult<Metadata> {
  keys: KVNamespaceListKeyTyped<Metadata>[];
  list_complete: boolean;
  cursor?: string;
}

interface KVNamespaceListKeyTyped<Metadata>
  extends KVNamespaceListKey<Metadata> {
  name: string;
  expiration?: number;
  metadata: Metadata;
}

type AccessKvEntity<ENTITY, META extends {} | void> = {
  put: META extends void
    ? (entity: ENTITY, options?: KVNamespacePutOptions) => Promise<void>
    : (
        entity: ENTITY,
        options: KVNamespacePutOptionsTyped<META>,
      ) => Promise<void>;
  get: () => Promise<ENTITY>;
  getOptional: () => Promise<ENTITY | null>;
  delete: () => Promise<void>;
  getWithMetadata: () => Promise<
    KVNamespaceGetWithMetadataResult<ENTITY, META>
  >;
};
type ListKvEntity<META extends {} | void = void> = {
  list: (options?: {
    limit?: number;
    cursor?: string;
  }) => META extends void
    ? Promise<KVNamespaceListResult<undefined>>
    : Promise<KVNamespaceListResultTyped<META>>;
};

export type NestedKVKey<
  PARAMETERS extends string[],
  ENTITY,
  META extends {} | void = void,
> = PARAMETERS extends [
  infer CURRENT_PARAMETER extends string,
  ...infer REST extends string[],
]
  ? {
      [key in CURRENT_PARAMETER]: (
        variable: string,
      ) => REST extends []
        ? AccessKvEntity<ENTITY, META>
        : NestedKVKey<REST, ENTITY, META>;
    } & ListKvEntity<META>
  : AccessKvEntity<ENTITY, META>;

export type KVKey<ENTITY, META extends {} | void = void> = NestedKVKey<
  [],
  ENTITY,
  META
>;

function getTypedKvInstanceForPath(
  kvNamespace: KVNamespace,
  currentPath: string = '',
) {
  return new Proxy({} as any, {
    get: function (_, method: string): any {
      if (currentPath === '') {
        return getTypedKvInstanceForPath(kvNamespace, method + ':');
      }
      switch (method) {
        case 'getOptional':
          return () => kvNamespace.get(currentPath, 'json');
        case 'get':
          return () => {
            const result = kvNamespace.get(currentPath, 'json');
            assertNotNullOrUndefined(result);
            return result;
          };
        case 'getWithMetadata':
          return () => kvNamespace.getWithMetadata(currentPath, 'json');
        case 'delete':
          return () => kvNamespace.delete(currentPath);
        case 'put':
          return (entity: any, options: any) =>
            kvNamespace.put(currentPath, JSON.stringify(entity), options);
        case 'list':
          return (options?: { limit?: number; cursor?: string }) =>
            kvNamespace.list({
              cursor: options?.cursor,
              limit: options?.limit,
              prefix: currentPath,
            });
        default:
          return (variable: string) => {
            return getTypedKvInstanceForPath(
              kvNamespace,
              currentPath + method + ':' + variable + ':',
            );
          };
      }
    },
  });
}

export function getTypedKVInstance<KV extends {}>(
  kvNamespace: KVNamespace,
): KV {
  return getTypedKvInstanceForPath(kvNamespace);
}
