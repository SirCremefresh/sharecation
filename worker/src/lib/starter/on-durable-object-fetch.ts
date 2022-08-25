import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {createBasicErrorResponse} from '../http/response';
import {logError} from '../logger';
import {BaseContext, RequestIdContext} from '../middleware/context';
import {addRequestId} from '../middleware/request-id-middleware';
import {BASE_CONTEXT} from './base-context';

export function onDurableObjectFetch<ENV extends {} = {}>(
  envGetter: () => ENV,
  fn: (
    request: Request,
    env: ENV,
    context: RequestIdContext & BaseContext,
  ) => Promise<Response>,
) {
  const packedFn = addRequestId(fn);
  return async (request: Request) => {
    // env needs to be fetched every request because it is still null on initializing function
    const env = envGetter();
    let context = Object.assign({}, BASE_CONTEXT);
    try {
      return await packedFn(request, env, context);
    } catch (e) {
      logError('Durable Object Error handling request', e, context);
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
