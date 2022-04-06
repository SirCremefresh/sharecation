/**
 * Base64 URL decode a string.
 */
export function decode(s: string): string {
  const base64 = pad(s).replace(/_/g, '/').replace(/-/g, '+');
  return decodeUnicode(atob(base64));
}

function decodeUnicode(s: string): string {
  try {
    return decodeURIComponent(
      s.replace(/(.)/g, (_, p) => {
        const code = p.charCodeAt(0).toString(16).toUpperCase();
        if (code.length < 2) {
          return '%0' + code;
        }
        return '%' + code;
      }),
    );
  } catch {
    return s;
  }
}

/**
 * Pads a base64 encoded string with equal signs.
 */
function pad(s: string): string {
  switch (s.length % 4) {
    case 0:
      return s;
    case 2:
      return s + '==';
    case 3:
      return s + '=';
    default:
      throw 'Illegal base64url string!';
  }
}

/**
 * Base64 URL encode a string.
 */
export function encode(s: string): string {
  const escaped = encodeUnicode(s);
  const base64 = btoa(escaped);
  return base64.replace(/=/g, '').replace(/\//g, '_').replace(/\+/g, '-');
}

function encodeUnicode(s: string): string {
  return encodeURIComponent(s).replace(/%([0-9A-ITEM]{2})/g, (_, hex) =>
    String.fromCharCode(parseInt(hex, 16)),
  );
}
