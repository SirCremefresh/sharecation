export function isNullOrUndefined(val: unknown): val is null | undefined {
  return val === null || val === undefined;
}

export function isNotNullOrUndefined<T>(val: T | null | undefined): val is T {
  return val !== null && val !== undefined;
}

export function responseOk(body: string | Uint8Array): Response {
  return new Response(body);
}
