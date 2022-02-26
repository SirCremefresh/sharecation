import {COMMON_KV} from '../../lib/common-kv';
import {LoggerContext} from '../../lib/middleware/context';

const KEY_ALGORITHM = {
  name: 'RSA-PSS',
  modulusLength: 1024,
  publicExponent: new Uint8Array([0x01, 0x00, 0x01]),
  hash: {name: 'SHA-256'},
};
const JWK_FORMAT = 'jwk';

export async function generateAndStoreNewSigningKeys(
  kv: KVNamespace,
  context: LoggerContext,
): Promise<{ privateKey: CryptoKey; publicJwkString: string; kid: string; privateJwkString: string }> {
  context.logger.info(
    `Generating new signing and verifying keys with algorithm: ${JSON.stringify(
      KEY_ALGORITHM,
    )}`,
  );
  const {
    publicKey,
    privateKey,
  } = (await crypto.subtle.generateKey(KEY_ALGORITHM, true, [
    'sign',
    'verify',
  ])) as CryptoKeyPair;
  context.logger.info('Generated new signing and verifying keys');

  const {
    publicJkw,
    privateJkw: privateJkwWithoutKid,
  } = await exportPublicAndPrivateInJwk(publicKey, privateKey);
  context.logger.info('Converted new signing and verifying keys to JWKs');

  const privateJkw = {...privateJkwWithoutKid, kid: crypto.randomUUID()};

  context.logger.info(
    `Storing new signing and verifying keys with kid: ${privateJkw.kid}`,
  );
  const publicJwkKey = COMMON_KV.PUBLIC_JWK(privateJkw.kid);
  const privateJwkKey = COMMON_KV.PRIVATE_JWK(privateJkw.kid);
  const publicJwkString = JSON.stringify(publicJkw);
  const privateJwkString = JSON.stringify(privateJkw);
  await Promise.all([
    kv.put(publicJwkKey, publicJwkString),
    kv.put(privateJwkKey, privateJwkString),
    kv.put(COMMON_KV.CURRENT_PRIVATE_JWK, JSON.stringify(privateJkw)),
  ]);

  context.logger.info(
    `Stored new signing and verifying keys to KV keys ${publicJwkKey} and ${privateJwkKey}`,
  );

  return {privateKey, kid: privateJkw.kid, publicJwkString, privateJwkString};
}


async function exportPublicAndPrivateInJwk(
  publicKey: CryptoKey,
  privateKey: CryptoKey,
): Promise<{ publicJkw: JsonWebKey; privateJkw: JsonWebKey }> {
  const FORMAT = JWK_FORMAT;
  const [publicJkw, privateJkw] = (await Promise.all([
    crypto.subtle.exportKey(FORMAT, publicKey),
    crypto.subtle.exportKey(FORMAT, privateKey),
  ])) as [JsonWebKey, JsonWebKey];
  return {publicJkw, privateJkw};
}
