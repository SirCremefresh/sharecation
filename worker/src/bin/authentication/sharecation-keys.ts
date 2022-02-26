import {generateJwt} from '../../lib/authentication/jwt';
import {COMMON_KV} from '../../lib/common-kv';
import {isNotNullOrUndefined, isNullOrUndefined} from '../../lib/lib';
import {LoggerContext} from '../../lib/middleware/context';

const KEY_ALGORITHM = {
  name: 'RSA-PSS',
  modulusLength: 1024,
  publicExponent: new Uint8Array([0x01, 0x00, 0x01]),
  hash: {name: 'SHA-256'},
};
const JWK_FORMAT = 'jwk';
const EIGHT_HOURS_IN_SECONDS = 8 * 60 * 60;

let privateKeyAndLoadingTime: {
  cryptoKey: CryptoKey;
  loadingTime: number;
  kid: string;
} | null = null;

export async function generateSharecationJwt(
  userId: string,
  rights: string[],
  kv: KVNamespace,
  context: LoggerContext,
): Promise<{ jwtString: string, payload: { sub: string, exp: number, rights: string[] } }> {
  const privateKey = await getPrivateKey(kv, context);
  const exp = Math.floor(Date.now() / 1000) + EIGHT_HOURS_IN_SECONDS;
  return await generateJwt(userId, rights, privateKey.cryptoKey, privateKey.kid, exp);
}

async function getPrivateKey(
  kv: KVNamespace,
  context: LoggerContext,
): Promise<{ cryptoKey: CryptoKey; kid: string }> {
  if (isNotNullOrUndefined(privateKeyAndLoadingTime)) {
    context.logger.info('Getting private key from cache');
    if (
      privateKeyAndLoadingTime.loadingTime >
      Date.now() - EIGHT_HOURS_IN_SECONDS
    ) {
      return privateKeyAndLoadingTime;
    }
  }
  context.logger.info('Getting private key from KV');
  const privateJwk = await kv.get<JsonWebKey & { kid: string }>(
    COMMON_KV.CURRENT_PRIVATE_JWK,
    'json',
  );
  if (isNullOrUndefined(privateJwk)) {
    throw new Error(
      `No private key found in KV with key: ${COMMON_KV.CURRENT_PRIVATE_JWK}.`,
    );
  }
  const cryptoKey = await crypto.subtle.importKey(
    JWK_FORMAT,
    privateJwk,
    KEY_ALGORITHM,
    false,
    ['sign'],
  );
  privateKeyAndLoadingTime = {
    cryptoKey,
    loadingTime: Date.now(),
    kid: privateJwk.kid,
  };
  return privateKeyAndLoadingTime;
}
