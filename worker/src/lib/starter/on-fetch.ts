import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {createBasicErrorResponse} from '../http/response';
import {isLoggerContext} from '../middleware/context';

export function onFetch<ENV extends {} = {}>(
  fn: (
    request: Request,
    env: ENV,
    context: ExecutionContext,
  ) => Promise<Response>,
) {
  return async (request: Request, env: ENV, context: ExecutionContext) => {
    try {
      return await fn(request, env, context ?? {} as ExecutionContext);
    } catch (e) {

      const text = 'Error handling request error=' + e + 'stack=' + (e as Error)?.stack;
      if (isLoggerContext(context)) {
        context.logger.error(text);
      } else {
        console.error(text);
      }
      return createBasicErrorResponse({
        message: 'Error handling request',
        code: BasicError_BasicErrorCode.UNKNOWN
      }, context);
    }
  };
}
