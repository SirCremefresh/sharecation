import {logError} from '../logger';
import {BaseContext, LoggerContext} from '../middleware/context';
import {addLoggerContextToSchedule, LoggerConfig} from '../middleware/logger-middleware';
import {BASE_CONTEXT} from './base-context';

export function onScheduled<ENV extends LoggerConfig>(
  serviceName: string,
  fn: (
    event: ScheduledEvent,
    env: ENV,
    context: ExecutionContext & LoggerContext & BaseContext,
  ) => Promise<void>,
) {
  const packedFn = addLoggerContextToSchedule(serviceName, fn);
  const baseContext: BaseContext = globalThis.TESTING_BASE_CONTEXT ?? BASE_CONTEXT;
  return async (request: ScheduledEvent, env: ENV, context: ExecutionContext) => {
    try {
      return await packedFn(request, env, Object.assign(context, baseContext));
    } catch (e) {
      logError('Error in scheduled event', e, context);
      throw e;
    }
  };
}
