import {formatErrorToString} from 'workers-loki-logger';
import {isNullOrUndefined} from './lib';
import {isLoggerContext,} from './middleware/context';

export function logInfo(message: string, context: {}) {
  if (isLoggerContext(context)) {
    context.logger.info(message);
  } else {
    console.info(message);
  }
}

export function logError(message: string, context: {}): void;
export function logError(message: string, error: any, context: {}): void;
export function logError(
  message: string,
  param1: any | {},
  param2?: {},
) {
  const {error, context} = isNullOrUndefined(param2)
    ? {error: param1, context: param2}
    : {error: undefined, context: param1};
  if (isLoggerContext(context)) {
    context.logger.error(message, error);
  } else {
    console.error(message + ' ' + formatErrorToString(error), error);
  }
}

