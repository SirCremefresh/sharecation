import {isNotNullOrUndefined} from './lib';
import {
  isAuthenticatedContext,
  isExecutionContext,
  isLoggerContext,
  isRequestIdContext,
  isRouteContext
} from './middleware/context';

export function logInfo(message: string, context: {}) {
  if (isLoggerContext(context)) {
    context.logger.info(message);
  } else {
    console.log(message);
  }
}

function unknownErrorToString(error: any): string {
  let errorMessage = ' error=';
  if (isNotNullOrUndefined(error.message)) {
    errorMessage += typeof error;
    errorMessage += error.message;
  } else {
    errorMessage += error;
  }
  if (isNotNullOrUndefined(error.stack)) {
    errorMessage += ', stack=' + error.stack;
  }
  return errorMessage;
}

export function logErrorWithException(message: string, error: any, context: {}) {
  if (isLoggerContext(context)) {
    context.logger.errorWithException(message, error);
  } else {
    console.log(message + unknownErrorToString(error));
  }
}

export interface LoggerConfig {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
}

export class Logger {
  timeNanoSeconds = Date.now() * 1000000;
  messages: { time: number; message: string; level: 'info' | 'error' | 'fatal' }[] = [];

  constructor(
    private config: LoggerConfig,
    private context: {},
    private serviceName: string,
  ) {
  }

  info(message: string) {
    this.messages.push({
      time: ++this.timeNanoSeconds,
      message,
      level: 'info',
    });
    console.log(`${this.serviceName}: ${message}`);
  }

  async flush() {
    if (this.messages.length === 0) {
      console.log('no messages to flush');
      return;
    }
    const serviceSnipped = 'serviceName=' + this.serviceName;
    const requestIdSnipped = isRequestIdContext(this.context)
      ? 'requestId=' + this.context.requestId
      : '';
    const userIdSnipped = isAuthenticatedContext(this.context)
      ? 'userId=' + this.context.user.userId
      : '';
    const pathSnipped = isRouteContext(this.context)
      ? 'path=' + this.context.route.path
      : '';
    const request = {
      streams: [
        {
          stream: {
            service: this.serviceName,
            environment: this.config.ENVIRONMENT,
          },
          values: this.messages.map(messageEntry => [
            messageEntry.time.toString(),
            `${serviceSnipped} ${requestIdSnipped} ${userIdSnipped} ${pathSnipped} level=${messageEntry.level} ${messageEntry.message}`,
          ]),
        },
      ],
    };
    const saveLogsPromise = fetch('https://logs-prod-eu-west-0.grafana.net/loki/api/v1/push', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Basic ${this.config.LOKI_SECRET}`,
      },
      body: JSON.stringify(request),
    });
    if (isExecutionContext(this.context)) {
      this.context.waitUntil(saveLogsPromise);
    } else {
      await saveLogsPromise;
    }

  }

  error(message: string) {
    this.messages.push({
      time: ++this.timeNanoSeconds,
      message,
      level: 'error',
    });
    console.error(`${this.serviceName}: ${message}`);
  }

  errorWithException(message: string, exception: any) {
    this.error(message + unknownErrorToString(exception));
  }

  fatal(message: string) {
    this.messages.push({
      time: ++this.timeNanoSeconds,
      message,
      level: 'fatal',
    });
    console.error(`${this.serviceName}: ${message}`);
  }
}
