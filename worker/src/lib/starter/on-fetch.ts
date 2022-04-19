import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {createBasicErrorResponse} from '../http/response';
import {logErrorWithException} from '../logger';
import {RequestIdContext} from '../middleware/context';
import {addRequestId} from '../middleware/request-id-middleware';

export function onFetch<ENV extends {} = {}>(
  fn: (
    request: Request,
    env: ENV,
    context: ExecutionContext & RequestIdContext,
  ) => Promise<Response>,
) {
  const packedFn = addRequestId(fn);
  return async (request: Request, env: ENV, context: ExecutionContext) => {
    try {
      return await packedFn(request, env, context);
    } catch (e) {
      logErrorWithException('Error handling request', e, context);
      return createBasicErrorResponse(
        {
          message: 'Error handling request',
          code: BasicError_BasicErrorCode.UNKNOWN,
        },
        context,
      );
    }
  };
}
