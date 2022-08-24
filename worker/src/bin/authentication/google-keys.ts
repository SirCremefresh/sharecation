import {
  getKidFromDecodedJwt,
  tryDecodeJwt,
} from '../../lib/authentication/jwt';
import { isNotNullOrUndefined, isNullOrUndefined } from '../../lib/lib';
import { LoggerContext } from '../../lib/middleware/context';
import type { AuthenticationKv } from './authentication-kv';

const GOOGLE_VERIFY_ALGORITHM = {
  name: 'RSASSA-PKCS1-v1_5',
  hash: 'SHA-256',
};
const LOADED_SIGNING_KEYS: Map<string, CryptoKey> = new Map();
const GOOGLE_AUD = 'sharecation-production';

async function getGoogleVerifyingKey(
  kid: string,
  kv: AuthenticationKv,
): Promise<CryptoKey | null> {
  let key = LOADED_SIGNING_KEYS.get(kid);
  if (isNotNullOrUndefined(key)) {
    return key;
  }
  const jwk = await kv.googleVerifyingJWKS.kid(kid).getOptional();
  if (isNullOrUndefined(jwk)) {
    return null;
  }
  key = await crypto.subtle.importKey(
    'jwk',
    jwk,
    GOOGLE_VERIFY_ALGORITHM,
    false,
    ['verify'],
  );
  LOADED_SIGNING_KEYS.set(kid, key);
  return key;
}

export async function verifyGoogleJwt(
  jwtString: string,
  kv: AuthenticationKv,
  context: LoggerContext,
): Promise<string | null> {
  const jwt = tryDecodeJwt(jwtString, context);
  if (isNullOrUndefined(jwt)) {
    context.logger.info(`Could not decode JWT: ${jwtString}`);
    return null;
  }
  const kid = getKidFromDecodedJwt(jwt);
  if (isNullOrUndefined(kid)) {
    return null;
  }

  if (jwt.payload?.aud !== GOOGLE_AUD) {
    context.logger.error(
      `User tried to verify googleJwt with wrong aud googleAud=${GOOGLE_AUD} , jwt=${JSON.stringify(
        jwt,
      )}`,
    );
    return null;
  }

  const key = await getGoogleVerifyingKey(kid, kv);
  if (isNullOrUndefined(key)) {
    throw new Error(`Could not find Google verifying key for kid: ${kid}`);
  }

  const data = new TextEncoder().encode(
    [jwt.raw.header, jwt.raw.payload].join('.'),
  );
  const signature = new Uint8Array(
    Array.from(jwt.signature).map((c) => c.charCodeAt(0)),
  );

  const valid = crypto.subtle.verify(
    GOOGLE_VERIFY_ALGORITHM,
    key,
    signature,
    data,
  );
  if (!valid) {
    return null;
  }

  if (
    !jwt.payload.hasOwnProperty('sub') ||
    !jwt.payload.hasOwnProperty('exp')
  ) {
    return null;
  }

  if (Date.now() >= jwt.payload.exp * 1000) {
    context.logger.info(
      `User tried to exchange token with expired google token. userId=${jwt.payload.sub}`,
    );
    return null;
  }

  return jwt.payload.sub;
}
