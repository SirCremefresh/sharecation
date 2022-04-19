import {RequestIdContext} from './context';

const requestIdHeader = 'X-Request-ID';

// This middleware is default on the following starters
// on-fetch
// on-durable-object-fetch
export function addRequestId<REQUEST extends Request,
  ENV,
  CONTEXT,
  RESPONSE extends Response,
  >(
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & RequestIdContext,
  ) => Promise<RESPONSE>,
) {
  return async (request: REQUEST, env: ENV, cfContext: CONTEXT) => {
    const requestId = request.headers.get(requestIdHeader) ?? crypto.randomUUID();
    const response = await fn(request, env, Object.assign(cfContext, {requestId}));
    response.headers.set(requestIdHeader, requestId);
    return response;
  };
}
