import { RequestIdContext } from './context';

export function addRequestId<
  REQUEST,
  ENV,
  CONTEXT extends ExecutionContext,
  RESPONSE extends Response | null,
>(
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & RequestIdContext,
  ) => Promise<RESPONSE>,
) {
  return (request: REQUEST, env: ENV, cfContext: CONTEXT) => {
    const requestId = crypto.randomUUID();
    return fn(request, env, Object.assign(cfContext, { requestId }));
  };
}
