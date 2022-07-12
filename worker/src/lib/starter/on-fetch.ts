import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {createBasicErrorResponse} from '../http/response';
import {logError} from '../logger';
import {LoggerContext, RequestIdContext} from '../middleware/context';
import {addCors} from '../middleware/cors-middleware';
import {addLoggerContext} from '../middleware/logger-middleware';
import {addRequestId} from '../middleware/request-id-middleware';

export function onFetch<ENV extends {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
},
  >(
  serviceName: string,
  fn: (
    request: Request,
    env: ENV,
    context: ExecutionContext & RequestIdContext & LoggerContext,
  ) => Promise<Response>,
  initialContextGetter?: (request: Request, env: ENV, context: ExecutionContext) => Promise<Response>,
) {
  const packedFn = initialContextGetter ?? addCors(addRequestId(addLoggerContext(serviceName, fn)));
  return async (request: Request, env: ENV, context: ExecutionContext) => {
    try {
      return await packedFn(request, env, context);
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
