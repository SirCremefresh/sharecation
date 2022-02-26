import {RIGHTS} from '../../lib/rights';

interface ServiceAccountConfig {
  type: 'service-account';
  workerName: string;
  envVariable: string;
  rights: string[];
}

interface PublicKeyConfig {
  type: 'public-key';
  workerName: string;
  envVariable: string;
}

interface PrivateKeyConfig {
  type: 'private-key';
  workerName: string;
  envVariable: string;
}

export function privateKeyConfigs(accounts: AccountConfig[]): PrivateKeyConfig[] {
  return accounts.filter(account => account.type === 'private-key') as PrivateKeyConfig[];
}

export function publicKeyConfigs(accounts: AccountConfig[]): PublicKeyConfig[] {
  return accounts.filter(account => account.type === 'public-key') as PublicKeyConfig[];
}

export function serviceAccountConfigs(accounts: AccountConfig[]): ServiceAccountConfig[] {
  return accounts.filter(account => account.type === 'service-account') as ServiceAccountConfig[];
}

type AccountConfig = ServiceAccountConfig | PublicKeyConfig | PrivateKeyConfig;

export const accounts: AccountConfig[] = [
  {
    type: 'service-account',
    workerName: 'sharecation-groups',
    envVariable: 'SERVICE_ACCOUNT_KEY',
    rights: [
      RIGHTS.ADMIN_GROUP
    ]
  },
  {
    type: 'public-key',
    workerName: 'sharecation-groups',
    envVariable: 'PUBLIC_KEY',
  },
  {
    type: 'private-key',
    workerName: 'sharecation-authentication',
    envVariable: 'PRIVATE_KEY',
  }
];
