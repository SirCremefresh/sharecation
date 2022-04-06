import { COMMON_KV } from '../common-kv';
import { isNotNullOrUndefined, isNullOrUndefined } from '../lib';
import { LoggerContext } from '../middleware/context';
import { TypedKvNamespace } from '../typed-kv-namespace';
import { DecodedJwt, getKidFromDecodedJwt } from './jwt';

const VERIFYING_KEYS = new Map<string, CryptoKey>();

async function getVerifyingKey(
  kid: string,
  kv: TypedKvNamespace<COMMON_KV>,
  context: LoggerContext,
): Promise<CryptoKey | null> {
  let key = VERIFYING_KEYS.get(kid);
  if (isNotNullOrUndefined(key)) {
    context.logger.info(`Found verifying key for kid ${kid} in cache`);
    return key;
  }
  const jwk = await kv.namespace.get<JsonWebKey>(
    kv.keys.PUBLIC_JWK(kid),
    'json',
  );
  if (isNullOrUndefined(jwk)) {
    return null;
  }
  key = await crypto.subtle.importKey(
    'jwk',
    jwk,
    {
      name: 'RSA-PSS',
      hash: { name: 'SHA-256' },
    },
    true,
    ['verify'],
  );
  context.logger.info(`Imported verifying key for kid ${kid}`);
  VERIFYING_KEYS.set(kid, key);
  return key;
}

export async function verifyJwt(
  jwt: DecodedJwt,
  kv: TypedKvNamespace<COMMON_KV>,
  context: LoggerContext,
): Promise<boolean> {
  const kid = getKidFromDecodedJwt(jwt);
  if (isNullOrUndefined(kid)) {
    context.logger.error(`Could not find kid in jwt`);
    return false;
  }

  const key = await getVerifyingKey(kid, kv, context);
  if (isNullOrUndefined(key)) {
    throw new Error(`Could not find verifying key for kid: ${kid}`);
  }

  const data = new TextEncoder().encode(
    [jwt.raw.header, jwt.raw.payload].join('.'),
  );
  const signature = new Uint8Array(
    Array.from(jwt.signature).map((c) => c.charCodeAt(0)),
  );

  return crypto.subtle.verify(
    {
      name: 'RSA-PSS',
      saltLength: 20,
    },
    key,
    signature,
    data,
  );
}
