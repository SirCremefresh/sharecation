import {
  isAuthenticatedContext,
  isRequestIdContext,
} from './middleware/context';

export interface LoggerConfig {
  LOKI_SECRET: string;
  ENVIRONMENT: string;
}

export class Logger {
  timeNanoSeconds = Date.now() * 1000000;
  messages: { time: number; message: string; level: 'info' | 'error' }[] = [];

  constructor(
    private config: LoggerConfig,
    private context: ExecutionContext,
    private serviceName: string,
  ) {}

  info(message: string) {
    this.messages.push({
      time: ++this.timeNanoSeconds,
      message,
      level: 'info',
    });
    console.log(`${this.serviceName}: ${message}`);
  }

  flush() {
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
    const request = {
      streams: [
        {
          stream: {
            service: this.serviceName,
            environment: this.config.ENVIRONMENT,
          },
          values: this.messages.map(messageEntry => [
            messageEntry.time.toString(),
            `${serviceSnipped} ${requestIdSnipped} ${userIdSnipped} level=${messageEntry.level} ${messageEntry.message}`,
          ]),
        },
      ],
    };
    this.context.waitUntil(
      fetch('https://logs-prod-eu-west-0.grafana.net/loki/api/v1/push', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Basic ${this.config.LOKI_SECRET}`,
        },
        body: JSON.stringify(request),
      }),
    );
  }

  error(message: string) {
    this.messages.push({
      time: ++this.timeNanoSeconds,
      message,
      level: 'error',
    });
    console.error(`${this.serviceName}: ${message}`);
  }
}
