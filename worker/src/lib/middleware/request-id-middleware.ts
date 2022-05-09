import {requestIdHeader} from '../request-id-header';
import {RequestIdContext} from './context';


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
