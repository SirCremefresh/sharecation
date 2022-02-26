import {generateJwt} from '../../lib/authentication/jwt';
import {addLoggerContextToSchedule,} from '../../lib/middleware/logger-middleware';
import {accounts, privateKeyConfigs, publicKeyConfigs, serviceAccountConfigs} from './accounts';
import {generateAndStoreNewSigningKeys,} from './generate-sharecation-keys';
import {loadAndSaveGoogleVerifyingKeys} from './load-google-keys';

const SERVICE_NAME = 'authentication-scheduled';
const TWO_DAYS_IN_SECONDS = 2 * 24 * 60 * 60;

interface Env {
  ENVIRONMENT: string;
  COMMON: KVNamespace;
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
                                      value
                                    }: SetEnvironmentSecret): Promise<void> {
  await fetch(`https://api.cloudflare.com/client/v4/accounts/8abcdde3abdbcc6cac82cc66c24c2c03/workers/services/${workerName}/environments/${environment}/secrets`, {
    body: JSON.stringify({
      name,
      text: value,
      type: 'secret_text'
    }),
    headers: {
      Authorization: 'Bearer ' + accountSecret,
      'Content-Type': 'application/json'
    },
    method: 'PUT'
  });
}

// noinspection JSUnusedGlobalSymbols
export default {
  scheduled: addLoggerContextToSchedule<Env>(
    SERVICE_NAME,
    async (event, env, context) => {
      context.logger.info('Starting Authentication CronJob');

      const {
        privateKey, kid, privateJwkString, publicJwkString
      } = await generateAndStoreNewSigningKeys(env.COMMON, context);
      await loadAndSaveGoogleVerifyingKeys(env.COMMON, context);


      await Promise.all([
        ...privateKeyConfigs(accounts).map(account =>
          setEnvironmentSecret({
            accountSecret: env.ACCOUNT_SECRET,
            workerName: account.workerName,
            environment: env.ENVIRONMENT,
            name: account.envVariable,
            value: privateJwkString
          })),
        ...publicKeyConfigs(accounts).map(account =>
          setEnvironmentSecret({
            accountSecret: env.ACCOUNT_SECRET,
            workerName: account.workerName,
            environment: env.ENVIRONMENT,
            name: account.envVariable,
            value: publicJwkString
          })),
        ...serviceAccountConfigs(accounts).map(async account => {
          const {jwtString} = await generateJwt(account.workerName, account.rights, privateKey, kid, TWO_DAYS_IN_SECONDS);
          await setEnvironmentSecret({
            accountSecret: env.ACCOUNT_SECRET,
            workerName: account.workerName,
            environment: env.ENVIRONMENT,
            name: account.envVariable,
            value: jwtString
          });
        }),
      ]);

      context.logger.info('Finished Authentication CronJob');
    },
  ),
};
