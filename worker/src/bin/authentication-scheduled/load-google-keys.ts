import {COMMON_KV} from '../../lib/common-kv';
import {LoggerContext} from '../../lib/middleware/context';

const TWO_WEEKS_IN_SECONDS = 14 * 24 * 60 * 60;

export async function loadAndSaveGoogleVerifyingKeys(
  kv: KVNamespace,
  context: LoggerContext,
): Promise<void> {
  const EXPIRATION = {expirationTtl: TWO_WEEKS_IN_SECONDS};
  const KEYS_URL =
    'https://www.googleapis.com/service_accounts/v1/metadata/JWK/securetoken@system.gserviceaccount.com';
  context.logger.info(`Fetching Google signing keys from: ${KEYS_URL}`);
  const response = await fetch(KEYS_URL, {
    method: 'GET',
  }).then(body => body.json<{ keys: (JsonWebKey & { kid: string })[] }>());
  context.logger.info(
    `Fetched ${
      response.keys.length
    } Google signing keys. kids: ${response.keys.map(key => key.kid)}`,
  );

  await Promise.all(
    response.keys.map(jwk => {
      kv.put(
        COMMON_KV.GOOGLE_VERIFYING_JWK(jwk.kid),
        JSON.stringify(jwk),
        EXPIRATION,
      );
    }),
  );

  context.logger.info(
    `Stored Google signing keys to ${COMMON_KV.GOOGLE_VERIFYING_JWKS}`,
  );
}
