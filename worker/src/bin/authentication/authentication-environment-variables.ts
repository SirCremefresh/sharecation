export interface AuthenticationEnvironmentVariables {
  ENVIRONMENT: string;
  PUBLIC_KEYS: string;
  COMMON: KVNamespace;
  AUTHENTICATION: KVNamespace;
  ROLES_STORAGE: DurableObjectNamespace;
  LOKI_SECRET: string;
}
