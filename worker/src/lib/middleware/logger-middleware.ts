import {Logger} from 'workers-loki-logger';
import {logError} from '../logger';
import {isAuthenticatedContext, isRequestIdContext, isRouteContext, LoggerContext} from './context';

export interface LoggerConfig {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
}

function addLoggerToContext<CONTEXT extends {}>(
  serviceName: string,
  loggingConfig: LoggerConfig,
  context: CONTEXT,
): CONTEXT & LoggerContext {
  const logger = new Logger({
    lokiSecret: loggingConfig.LOKI_SECRET,
    cloudflareContext: context,
    stream: {
      service: serviceName,
      environment: loggingConfig.ENVIRONMENT,
    }
  });
  return Object.assign(context, {logger});
}

function isString(type: any): type is string {
  return typeof type === 'string';
}

export function addLoggerContext<ENV extends LoggerConfig,
  REQUEST,
  CONTEXT extends {},
  RESPONSE,
  >(
  serviceNameParam: string | (() => string),
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & LoggerContext,
  ) => Promise<RESPONSE>,
) {
  return async (request: REQUEST, env: ENV, cfContext: CONTEXT) => {
    const serviceName = isString(serviceNameParam) ? serviceNameParam : serviceNameParam();
    const context = addLoggerToContext(
      serviceName,
      env,
      cfContext
    );
    let response;
    try {
      response = await fn(request, env, context);
    } catch (e) {
      logError('Logger caught error handling request', e, context);
      throw e;
    } finally {
      context.logger.mdcSet('serviceName', serviceName);
      if (isRequestIdContext(context)) {
        context.logger.mdcSet('requestId', context.requestId);
      }
      if (isAuthenticatedContext(context)) {
        context.logger.mdcSet('userId', context.user.userId);
      }
      if (isRouteContext(context)) {
        context.logger.mdcSet('path', context.route.path);
      }
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
      logError('Logger caught error handling request', e, context);
    } finally {
      context.logger.mdcSet('serviceName', serviceName);
      if (isRequestIdContext(context)) {
        context.logger.mdcSet('requestId', context.requestId);
      }
      if (isAuthenticatedContext(context)) {
        context.logger.mdcSet('userId', context.user.userId);
      }
      if (isRouteContext(context)) {
        context.logger.mdcSet('path', context.route.path);
      }
      await context.logger.flush();
    }
  };
}
