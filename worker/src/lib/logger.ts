import {formatErrorToString} from 'workers-loki-logger';
import {isLoggerContext,} from './middleware/context';

export function logInfo(message: string, context: {}) {
  if (isLoggerContext(context)) {
    context.logger.info(message);
  } else {
    console.info(message);
  }
}

export function logErrorWithException(
  message: string,
  error: any,
  context: {},
) {
  if (isLoggerContext(context)) {
    context.logger.error(message, error);
  } else {
    console.error(message + ' ' + formatErrorToString(error), error);
  }
}

