import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {createBasicErrorResponse} from '../http/response';

export function onFetch<ENV extends {} = {}>(
  fn: (
    request: Request,
    env: ENV,
    context: ExecutionContext,
  ) => Promise<Response>,
) {
  return async (request: Request, env: ENV, context: ExecutionContext) => {
    try {
      return await fn(request, env, context);
    } catch (e) {
      console.error('Error handling request', e);
      return createBasicErrorResponse({
        message: 'Error handling request',
        code: BasicError_BasicErrorCode.UNKNOWN
      }, context);
    }
  };
}
