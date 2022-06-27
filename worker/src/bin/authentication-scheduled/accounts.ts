import { isNullOrUndefined } from '../../lib/lib';
import { ROLES } from '../../lib/roles';

interface ServiceAccountConfig {
  type: 'service-account';
  onlyEnvironment?: 'production' | 'development';
  workerName: string;
  envVariable: string;
  roles: string[];
}

interface PublicKeyConfig {
  type: 'public-key';
  onlyEnvironment?: 'production' | 'development';
  workerName: string;
  envVariable: string;
}

interface PrivateKeyConfig {
  type: 'private-key';
  onlyEnvironment?: 'production' | 'development';
  workerName: string;
  envVariable: string;
}

interface LokiKeyConfig {
  type: 'loki-key';
  onlyEnvironment?: 'production' | 'development';
  workerName: string;
}

export function privateKeyConfigs(
  accounts: AccountConfig[],
): PrivateKeyConfig[] {
  return accounts.filter(
    (account) => account.type === 'private-key',
  ) as PrivateKeyConfig[];
}

export function publicKeyConfigs(accounts: AccountConfig[]): PublicKeyConfig[] {
  return accounts.filter(
    (account) => account.type === 'public-key',
  ) as PublicKeyConfig[];
}

export function lokiKeyConfigs(accounts: AccountConfig[]): LokiKeyConfig[] {
  return accounts.filter(
    (account) => account.type === 'loki-key',
  ) as LokiKeyConfig[];
}

export function serviceAccountConfigs(
  accounts: AccountConfig[],
): ServiceAccountConfig[] {
  return accounts.filter(
    (account) => account.type === 'service-account',
  ) as ServiceAccountConfig[];
}

type AccountConfig =
  | ServiceAccountConfig
  | PublicKeyConfig
  | PrivateKeyConfig
  | LokiKeyConfig;

export function getAccounts(environment: string) {
  return accounts.filter(
    (account) =>
      isNullOrUndefined(account.onlyEnvironment) ||
      account.onlyEnvironment === environment,
  );
}

const accounts: AccountConfig[] = [
  ...defaultService({ workerName: 'sharecation-authentication' }),
  ...defaultService({
    workerName: 'sharecation-dev-tools',
    onlyEnvironment: 'development',
  }),
  ...defaultService({ workerName: 'sharecation-groups' }),
  ...defaultService({ workerName: 'sharecation-images' }),
  ...defaultService({ workerName: 'sharecation-ping' }),
  {
    type: 'service-account',
    workerName: 'sharecation-groups',
    envVariable: 'SERVICE_ACCOUNT_KEY',
    roles: [ROLES.ADMIN_ROLES_WRITE],
  },
  {
    type: 'private-key',
    workerName: 'sharecation-authentication',
    envVariable: 'PRIVATE_KEY',
  },
];

function defaultService({
  workerName,
  onlyEnvironment,
}: {
  workerName: string;
  onlyEnvironment?: 'production' | 'development';
}): AccountConfig[] {
  return [
    {
      type: 'public-key',
      onlyEnvironment,
      workerName,
      envVariable: 'PUBLIC_KEYS',
    },
    {
      type: 'loki-key',
      onlyEnvironment,
      workerName,
    },
  ];
}
