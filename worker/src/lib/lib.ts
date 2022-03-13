export function isNullOrUndefined(val: unknown): val is null | undefined {
  return val === null || val === undefined;
}

export function isNotNullOrUndefined<T>(val: T | null | undefined): val is T {
  return val !== null && val !== undefined;
}

export function responseOk(body: string | Uint8Array): Response {
  return createResponse(body, 200);
}

export function responseErrForbidden() {
  return responseJsonErrorReason('FORBIDDEN', 403);
}

type ContentType = 'application/octet-stream' | 'application/json'

export function responseJsonErrorReason(
  reason: string,
  statusCode: number,
): Response {
  return createResponse(JSON.stringify({reason}), statusCode, 'application/json');
}

export function createResponse(body: string | Uint8Array, statusCode: number = 200, contentType: ContentType = 'application/octet-stream'): Response {
  return new Response(body, {
    status: statusCode,
    headers: {
      'Content-Type': contentType,
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    },
  });
}
