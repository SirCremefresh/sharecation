import {isNullOrUndefined} from '../lib';
import {LoggerContext} from '../middleware/context';
import {decode, encode} from './base64';

export const SIGN_VERIFY_ALGORITHM = {
  name: 'RSA-PSS',
  saltLength: 20,
};

export interface DecodedJwt {
  header: {
    [key: string]: string;
  };
  payload: {
    exp: number;
    sub: string;
    rights: string[]
  };
  signature: string;
  raw: { header: string; payload: string; signature: string };
}

export function decodeJwt(token: string): DecodedJwt {
  const parts = token.split('.');
  const header = JSON.parse(decode(parts[0]));
  const payload = JSON.parse(decode(parts[1]));
  const signature = decode(parts[2].replace(/_/g, '/').replace(/-/g, '+'));

  return {
    header: header,
    payload: payload,
    signature: signature,
    raw: {header: parts[0], payload: parts[1], signature: parts[2]},
  };
}

export function tryDecodeJwt(
  token: string,
  context: LoggerContext,
): DecodedJwt | null {
  try {
    return decodeJwt(token);
  } catch (err) {
    context.logger.error('Failed to decode JWT with error: ' + err);
    return null;
  }
}

export function getKidFromDecodedJwt(jwt: DecodedJwt): string | null {
  if (!jwt.header?.hasOwnProperty('kid')) {
    return null;
  }
  if (isNullOrUndefined(jwt.header.kid)) {
    return null;
  }
  if (typeof jwt.header.kid !== 'string') {
    return null;
  }
  return jwt.header.kid;
}

export function isExpired(jwt: DecodedJwt): boolean {
  return jwt.payload.exp < Date.now() / 1000;
}

export async function generateJwt(sub: string, rights: string[], cryptoKey: CryptoKey, kid: string, exp: number) {
  const payload = {
    sub: sub,
    exp: exp,
    rights
  };
  const header = generateJwtHeader(kid);
  const partial =
    encode(JSON.stringify(header)) + '.' + encode(JSON.stringify(payload));
  const encodedPartial = new TextEncoder().encode(partial);
  const signature = await crypto.subtle.sign(
    SIGN_VERIFY_ALGORITHM,
    cryptoKey,
    encodedPartial,
  );
  return {
    jwtString: partial + '.' + encode(String.fromCharCode(...new Uint8Array(signature))),
    payload,
  };
}

function generateJwtHeader(
  kid: string,
): { kid: string; typ: string; alg: string } {
  return {
    typ: 'JWT',
    alg: 'PS256',
    kid: kid,
  };
}
