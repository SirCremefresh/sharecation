import { BasicError_BasicErrorCode } from '../../contracts/errors/v1/errors';
import { createBasicErrorResponse } from '../http/response';
import { isLoggerContext } from './context';

export function addGuard<
  REQUEST extends Request,
  ENV,
  CONTEXT,
  RESPONSE extends Response,
>(
  guard: (request: REQUEST, env: ENV, context: CONTEXT) => boolean,
  fn: (request: REQUEST, env: ENV, context: CONTEXT) => Promise<RESPONSE>,
): (request: REQUEST, env: ENV, context: CONTEXT) => Promise<Response> {
  return async (request: REQUEST, env: ENV, context: CONTEXT) => {
    let allowed;
    try {
      allowed = guard(request, env, context);
    } catch (e) {
      if (isLoggerContext(context)) {
        context.logger.error(`Failed to execute guard ${e}`);
      }
      throw e;
    }
    if (allowed) {
      return fn(request, env, context);
    } else {
      return createBasicErrorResponse(
        {
          message: 'Access was denied',
          code: BasicError_BasicErrorCode.UNAUTHENTICATED,
        },
        context,
      );
    }
  };
}
