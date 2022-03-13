import {isNotNullOrUndefined} from '../lib';
import {Logger} from '../logger';

export interface AuthenticatedContext {
  user: {
    userId: string;
    rights: Set<string>
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
    path: string
    params: { [key: string]: string };
  };
}

export function isRouteContext<T extends {}>(
  context: T | undefined | null,
): context is T & RouteContext {
  return isNotNullOrUndefined(context) && context.hasOwnProperty('route');
}


export interface ProtoBufContext<TYPE extends {}> {
  proto: {
    body: TYPE
  };
}
