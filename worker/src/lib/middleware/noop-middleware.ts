export function addNoop<REQUEST extends Request,
  ENV extends {},
  CONTEXT extends ExecutionContext,
  RESPONSE extends Response>(
  fn: (request: REQUEST, env: ENV, context: CONTEXT) => Promise<RESPONSE>,
): (request: REQUEST, env: ENV, context: CONTEXT) => Promise<RESPONSE> {
  return async (request: REQUEST, env: ENV, context: CONTEXT): Promise<RESPONSE> => {
    return await fn(request, env, context);
  };
}
