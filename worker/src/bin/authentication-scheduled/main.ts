import { generateJwt } from '../../lib/authentication/jwt';
import { addLoggerContextToSchedule } from '../../lib/middleware/logger-middleware';
import { createAuthenticationKv } from '../authentication/authentication-kv';
import {
  getAccounts,
  lokiKeyConfigs,
  privateKeyConfigs,
  publicKeyConfigs,
  serviceAccountConfigs,
} from './accounts';
import { generateAndStoreNewSigningKeys } from './generate-sharecation-keys';
import { loadAndSaveGoogleVerifyingKeys } from './load-google-keys';

const SERVICE_NAME = 'authentication-scheduled';
const TWO_DAYS_IN_SECONDS = 2 * 24 * 60 * 60;

interface Env {
  ENVIRONMENT: string;
  COMMON: KVNamespace;
  AUTHENTICATION: KVNamespace;
  LOKI_SECRET: string;
  ACCOUNT_SECRET: string;
}

interface SetEnvironmentSecret {
  accountSecret: string;
  workerName: string;
  environment: string;
  name: string;
  value: string;
}

async function setEnvironmentSecret({
  accountSecret,
  workerName,
  environment,
  name,
  value,
}: SetEnvironmentSecret): Promise<void> {
  // when switching to service mode the url needs to be changed to
  // `https://api.cloudflare.com/client/v4/accounts/8abcdde3abdbcc6cac82cc66c24c2c03/workers/services/${workerName}/environments/${environment}/secrets`
  await fetch(
    `https://api.cloudflare.com/client/v4/accounts/8abcdde3abdbcc6cac82cc66c24c2c03/workers/services/${workerName}-${environment}/environments/production/secrets`,
    {
      body: JSON.stringify({
        name,
        text: value,
        type: 'secret_text',
      }),
      headers: {
        Authorization: 'Bearer ' + accountSecret,
        'Content-Type': 'application/json',
      },
      method: 'PUT',
    },
  );
}

// noinspection JSUnusedGlobalSymbols
export default {
  scheduled: addLoggerContextToSchedule<Env>(
    SERVICE_NAME,
    async (event, env, context) => {
      context.logger.info('Starting Authentication CronJob');
      const authenticationKv = createAuthenticationKv(env.AUTHENTICATION);

      const { privateKey, kid, privateJwkString, currentPublicKeys } =
        await generateAndStoreNewSigningKeys(authenticationKv, context);
      await loadAndSaveGoogleVerifyingKeys(authenticationKv, context);

      const accounts = getAccounts(env.ENVIRONMENT);

      await Promise.all([
        ...privateKeyConfigs(accounts).map((account) =>
          setEnvironmentSecret({
            accountSecret: env.ACCOUNT_SECRET,
            workerName: account.workerName,
            environment: env.ENVIRONMENT,
            name: account.envVariable,
            value: privateJwkString,
          }),
        ),
        ...publicKeyConfigs(accounts).map((account) =>
          setEnvironmentSecret({
            accountSecret: env.ACCOUNT_SECRET,
            workerName: account.workerName,
            environment: env.ENVIRONMENT,
            name: account.envVariable,
            value: JSON.stringify(currentPublicKeys),
          }),
        ),
        ...lokiKeyConfigs(accounts).map((config) =>
          setEnvironmentSecret({
            accountSecret: env.ACCOUNT_SECRET,
            workerName: config.workerName,
            environment: env.ENVIRONMENT,
            name: 'LOKI_SECRET',
            value: env.LOKI_SECRET,
          }),
        ),
        ...serviceAccountConfigs(accounts).map(async (account) => {
          const { jwtString } = await generateJwt(
            account.workerName,
            account.rights,
            privateKey,
            kid,
            TWO_DAYS_IN_SECONDS,
          );
          await setEnvironmentSecret({
            accountSecret: env.ACCOUNT_SECRET,
            workerName: account.workerName,
            environment: env.ENVIRONMENT,
            name: account.envVariable,
            value: jwtString,
          });
        }),
      ]);

      context.logger.info('Finished Authentication CronJob');
    },
  ),
};
