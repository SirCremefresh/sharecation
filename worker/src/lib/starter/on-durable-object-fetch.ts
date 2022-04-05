import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {createBasicErrorResponse} from '../http/response';
import {logErrorWithException} from '../logger';

export function onDurableObjectFetch<ENV extends {} = {}>(
  envGetter: () => ENV,
  fn: (
    request: Request,
    env: ENV,
    context: {},
  ) => Promise<Response>,
) {
  return async (request: Request) => {
    // env needs to be fetched every request because it is still null on initializing function
    const env = envGetter();
    const context = {};
    try {
      return await fn(request, env, context);
    } catch (e) {
      logErrorWithException('Durable Object Error handling request', e, context);
      return createBasicErrorResponse({
        message: 'Error handling request',
        code: BasicError_BasicErrorCode.UNKNOWN
      }, context);
    }
  };
}
