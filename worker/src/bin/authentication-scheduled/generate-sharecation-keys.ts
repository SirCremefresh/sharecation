import { LoggerContext } from '../../lib/middleware/context';
import { TypedKvNamespace } from '../../lib/typed-kv-namespace';
import { AUTHENTICATION_KV } from '../authentication/authentication-kv';

const KEY_ALGORITHM = {
  name: 'RSA-PSS',
  modulusLength: 1024,
  publicExponent: new Uint8Array([0x01, 0x00, 0x01]),
  hash: { name: 'SHA-256' },
};
const JWK_FORMAT = 'jwk';

export async function generateAndStoreNewSigningKeys(
  authenticationKv: TypedKvNamespace<AUTHENTICATION_KV>,
  context: ExecutionContext & LoggerContext,
): Promise<{
  privateKey: CryptoKey;
  currentPublicKeys: JsonWebKey[];
  kid: string;
  privateJwkString: string;
}> {
  context.logger.info(
    `Generating new signing and verifying keys with algorithm: ${JSON.stringify(
      KEY_ALGORITHM,
    )}`,
  );
  const { publicKey, privateKey } = (await crypto.subtle.generateKey(
    KEY_ALGORITHM,
    true,
    ['sign', 'verify'],
  )) as CryptoKeyPair;
  context.logger.info('Generated new signing and verifying keys');

  const { publicJkw: publicJkwWithoutKid, privateJkw: privateJkwWithoutKid } =
    await exportPublicAndPrivateInJwk(publicKey, privateKey);
  context.logger.info('Converted new signing and verifying keys to JWKs');
  const kid = crypto.randomUUID();
  const privateJkw = { ...privateJkwWithoutKid, kid };
  const publicJkw = { ...publicJkwWithoutKid, kid };

  context.logger.info(
    `Storing new signing and verifying keys with kid: ${privateJkw.kid}`,
  );
  const publicJwkKey = authenticationKv.keys.PUBLIC_JWK(privateJkw.kid);
  const privateJwkKey = authenticationKv.keys.PRIVATE_JWK(privateJkw.kid);
  const publicJwkString = JSON.stringify(publicJkw);
  const privateJwkString = JSON.stringify(privateJkw);
  const currentPrivateKey =
    (await authenticationKv.namespace.get(
      authenticationKv.keys.NEXT_PRIVATE_JWK,
    )) ?? privateJwkString;
  const currentPublicKeys = [
    ...((await authenticationKv.namespace.get<JsonWebKey[]>(
      authenticationKv.keys.CURRENT_PUBLIC_JWKS,
      'json',
    )) ?? []),
    publicJkw,
  ].slice(-3);
  await Promise.all([
    authenticationKv.namespace.put(publicJwkKey, publicJwkString),
    authenticationKv.namespace.put(privateJwkKey, privateJwkString),
    authenticationKv.namespace.put(
      authenticationKv.keys.NEXT_PRIVATE_JWK,
      privateJwkString,
    ),
    authenticationKv.namespace.put(
      authenticationKv.keys.CURRENT_PRIVATE_JWK,
      currentPrivateKey,
    ),
    authenticationKv.namespace.put(
      authenticationKv.keys.CURRENT_PUBLIC_JWKS,
      JSON.stringify(currentPublicKeys),
    ),
  ]);

  context.logger.info(
    `Stored new signing and verifying keys to KV keys ${publicJwkKey} and ${privateJwkKey}, currentPublicKeys=${JSON.stringify(
      currentPublicKeys,
    )}`,
  );

  return {
    privateKey,
    kid: privateJkw.kid,
    currentPublicKeys,
    privateJwkString: currentPrivateKey,
  };
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
  return { publicJkw, privateJkw };
}
