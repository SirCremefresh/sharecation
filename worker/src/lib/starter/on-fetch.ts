import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {createBasicErrorResponse} from '../http/response';
import {logError} from '../logger';
import {BaseContext, LoggerContext, RequestIdContext} from '../middleware/context';
import {addCors} from '../middleware/cors-middleware';
import {addLoggerContext} from '../middleware/logger-middleware';
import {addRequestId} from '../middleware/request-id-middleware';

declare global {
  // noinspection ES6ConvertVarToLetConst
  var TESTING_BASE_CONTEXT: BaseContext | undefined | null;
}

const BASE_CONTEXT: BaseContext = {
  base: {
    fetch: (request: Request | string,
            requestInitr?: RequestInit | Request) => fetch(request, requestInitr),
  }
};


export function onFetch<ENV extends {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
},
  >(
  serviceName: string,
  fn: (
    request: Request,
    env: ENV,
    context: ExecutionContext & RequestIdContext & LoggerContext & BaseContext,
  ) => Promise<Response>,
) {
  const packedFn = addCors(addRequestId(addLoggerContext(serviceName, fn)));
  const baseContext: BaseContext = globalThis.TESTING_BASE_CONTEXT ?? BASE_CONTEXT;
  return async (request: Request, env: ENV, context: ExecutionContext) => {
    try {
      return await packedFn(request, env, Object.assign(context, baseContext));
    } catch (e) {
      logError('Error handling request', e, context);
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
