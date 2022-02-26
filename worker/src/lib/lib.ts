export function isNullOrUndefined(val: unknown): val is null | undefined {
  return val === null || val === undefined;
}

export function isNotNullOrUndefined<T>(val: T | null | undefined): val is T {
  return val !== null && val !== undefined;
}

export function responseOk(body: unknown): Response {
  return response(body, 200);
}

export function responseErrForbidden() {
  return responseErrReason('FORBIDDEN', 403);
}

export function responseErrReason(
  reason: string,
  statusCode: number,
): Response {
  return response({reason}, statusCode);
}

export function response(body: unknown, statusCode: number = 200): Response {
  return new Response(JSON.stringify(body), {
    status: statusCode,
    headers: {
      'Content-Type': 'application/json',
    },
  });
}
