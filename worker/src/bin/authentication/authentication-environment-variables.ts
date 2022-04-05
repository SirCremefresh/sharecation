export interface AuthenticationEnvironmentVariables {
  ENVIRONMENT: string;
  COMMON: KVNamespace;
  AUTHENTICATION: KVNamespace;
  RIGHTS_STORAGE: DurableObjectNamespace;
  LOKI_SECRET: string;
}
