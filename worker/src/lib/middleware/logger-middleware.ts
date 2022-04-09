import {logErrorWithException, Logger, LoggerConfig} from '../logger';
import {LoggerContext} from './context';

function addLoggerToContext<CONTEXT extends {}>(
  serviceName: string,
  loggingConfig: LoggerConfig,
  context: CONTEXT,
): CONTEXT & LoggerContext {
  const logger = new Logger(loggingConfig, context, serviceName);
  return Object.assign(context, {logger});
}

export function addLoggerContext<ENV extends LoggerConfig,
  REQUEST,
  CONTEXT extends {},
  RESPONSE,
  >(
  serviceName: string,
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & LoggerContext,
  ) => Promise<RESPONSE>,
) {
  return async (request: REQUEST, env: ENV, cfContext: CONTEXT) => {
    const context = addLoggerToContext(serviceName, env, cfContext);
    let response;
    try {
      response = await fn(request, env, context);
    } catch (e) {
      logErrorWithException('Logger caught error handling request', e, context);
      throw e;
    } finally {
      await context.logger.flush();
    }
    return response;
  };
}

export function addLoggerContextToSchedule<ENV extends LoggerConfig>(
  serviceName: string,
  fn: (
    event: ScheduledEvent,
    env: ENV,
    context: ExecutionContext & LoggerContext,
  ) => Promise<void>,
) {
  return async (
    event: ScheduledEvent,
    env: ENV,
    cfContext: ExecutionContext,
  ) => {
    const context = addLoggerToContext(serviceName, env, cfContext);
    try {
      await fn(event, env, context);
    } catch (e) {
      logErrorWithException('Logger caught error handling request', e, context);
    } finally {
      await context.logger.flush();
    }
  };
}
