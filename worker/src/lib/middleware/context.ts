import {MessageType} from '@protobuf-ts/runtime';
import {Logger} from 'workers-loki-logger';
import {MessageFormat} from '../http/types';
import {isNotNullOrUndefined} from '../lib';

export interface BaseContext {
  base: {
    fetch: typeof fetch;
  };
}

export interface TestingContext {
  test: true;
}

export function isTestingContext<T extends BaseContext>(
  context: T | undefined | null,
): context is T & TestingContext {
  return isNotNullOrUndefined(context) && context.hasOwnProperty('test');
}

export interface AuthenticatedContext {
  user: {
    userId: string;
    roles: Set<string>;
  };
}

export function isAuthenticatedContext<T extends {}>(
  context: T | undefined | null,
): context is T & AuthenticatedContext {
  return isNotNullOrUndefined(context) && context.hasOwnProperty('user');
}

export interface LoggerContext {
  logger: Logger;
}

export function isLoggerContext<T extends {}>(
  context: T | undefined | null,
): context is T & LoggerContext {
  return isNotNullOrUndefined(context) && context.hasOwnProperty('logger');
}

export interface RequestIdContext {
  requestId: string;
}

export function isRequestIdContext<T extends {}>(
  context: T | undefined | null,
): context is T & RequestIdContext {
  return isNotNullOrUndefined(context) && context.hasOwnProperty('requestId');
}

export interface RouteContext {
  route: {
    path: string;
    params: { [key: string]: string };
  };
}

export function isRouteContext<T extends {}>(
  context: T | undefined | null,
): context is T & RouteContext {
  return isNotNullOrUndefined(context) && context.hasOwnProperty('route');
}

export function isExecutionContext<T extends {}>(
  context: T | undefined | null,
): context is T & ExecutionContext {
  // We need to use getPrototypeOf since is not on the object itself
  // In future we should wrap execution context as a member of context
  // Like the other contexts
  return (
    isNotNullOrUndefined(context) &&
    (Object.getPrototypeOf(context).hasOwnProperty('waitUntil') ||
      context.hasOwnProperty('waitUntil'))
  );
}

export interface ProtoBufContext<TYPE extends {} | null> {
  proto: {
    body: TYPE;
    requestType: MessageType<any> | null;
    responseType: MessageType<any>;
    responseFormat: MessageFormat;
    requestFormat: MessageFormat;
  };
}

export function isProtoBufContext<T extends {}>(
  context: T | undefined | null,
): context is T & ProtoBufContext<{}> {
  return isNotNullOrUndefined(context) && context.hasOwnProperty('proto');
}
