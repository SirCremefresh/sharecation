import { LoggerContext } from '../../lib/middleware/context';
import { AuthenticationKv } from '../authentication/authentication-kv';

const KEY_ALGORITHM = {
  name: 'RSA-PSS',
  modulusLength: 1024,
  publicExponent: new Uint8Array([0x01, 0x00, 0x01]),
  hash: { name: 'SHA-256' },
};
const JWK_FORMAT = 'jwk';

export async function generateKeys() {
  const {publicKey, privateKey} = (await crypto.subtle.generateKey(
    KEY_ALGORITHM,
    true,
    ['sign', 'verify'],
  )) as CryptoKeyPair;
  return {publicKey, privateKey};
}

export async function generateAndStoreNewSigningKeys(
  authenticationKv: AuthenticationKv,
  context: ExecutionContext & LoggerContext,
): Promise<{
  privateKey: CryptoKey;
  currentPublicKeys: JsonWebKey[];
  kid: string;
  privateJwk: JsonWebKey;
}> {
  context.logger.info(
    `Generating new signing and verifying keys with algorithm: ${JSON.stringify(
      KEY_ALGORITHM,
    )}`,
  );
  const {publicKey, privateKey} = await generateKeys();
  context.logger.info('Generated new signing and verifying keys');

  const { publicJkw, privateJkw } =
    await exportPublicAndPrivateInJwk(publicKey, privateKey);
  context.logger.info('Converted new signing and verifying keys to JWKs');

  context.logger.info(
    `Storing new signing and verifying keys with kid: ${privateJkw.kid}`,
  );
  const currentPrivateKey =
    (await authenticationKv.nextPrivateJWK.getOptional()) ?? privateJkw;
  const currentPublicKeys = [
    ...((await authenticationKv.currentPublicJWKS.getOptional()) ?? []),
    publicJkw,
  ].slice(-3);
  await Promise.all([
    authenticationKv.publicJWKS.kid(publicJkw.kid).put(publicJkw),
    authenticationKv.privateJWKS.kid(privateJkw.kid).put(privateJkw),
    authenticationKv.nextPrivateJWK.put(privateJkw),
    authenticationKv.currentPrivateJWK.put(currentPrivateKey),
    authenticationKv.currentPublicJWKS.put(currentPublicKeys),
  ]);

  context.logger.info(
    `Stored new signing and verifying keys with kid=${
      currentPrivateKey.kid
    }, currentPublicKeys=${JSON.stringify(currentPublicKeys)}`,
  );

  return {
    privateKey,
    kid: privateJkw.kid,
    currentPublicKeys,
    privateJwk: currentPrivateKey,
  };
}

export async function exportPublicAndPrivateInJwk(
  publicKey: CryptoKey,
  privateKey: CryptoKey,
): Promise<{ publicJkw: JsonWebKey & {kid: string}; privateJkw: JsonWebKey& {kid: string} }> {
  const kid = crypto.randomUUID();
  const FORMAT = JWK_FORMAT;
  const [publicJkw, privateJkw] = (await Promise.all([
    crypto.subtle.exportKey(FORMAT, publicKey),
    crypto.subtle.exportKey(FORMAT, privateKey),
  ])) as [JsonWebKey, JsonWebKey];
  return { publicJkw: {kid, ...publicJkw}, privateJkw: {kid,...privateJkw} };
}
