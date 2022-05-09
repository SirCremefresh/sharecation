const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Access-Control-Max-Age': '3600',
};


export function addCors<REQUEST extends Request,
  ENV,
  CONTEXT,
  RESPONSE extends Response,
  >(
  fn: (request: REQUEST, env: ENV, context: CONTEXT) => Promise<RESPONSE>,
): (request: REQUEST, env: ENV, context: CONTEXT) => Promise<Response> {
  return async (
    request: REQUEST,
    env: ENV,
    context: CONTEXT,
  ): Promise<Response> => {
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        status: 200,
        headers: CORS_HEADERS,
      });
    }
    return await fn(request, env, context);
  };
}
