export function isNullOrUndefined(val: unknown): val is null | undefined {
  return val === null || val === undefined;
}

export function isNotNullOrUndefined<T>(val: T | null | undefined): val is T {
  return val !== null && val !== undefined;
}

export function responseOk(body: unknown): Response {
  return createResponse(body, 200);
}

export function responseErrForbidden() {
  return responseErrReason('FORBIDDEN', 403);
}

export function responseErrReason(
  reason: string,
  statusCode: number,
): Response {
  return createResponse({reason}, statusCode);
}

export function createResponse(body: unknown, statusCode: number = 200, contentType: string = 'application/octet-stream'): Response {
  return new Response(JSON.stringify(body), {
    status: statusCode,
    headers: {
      'Content-Type': contentType,
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    },
  });
}
