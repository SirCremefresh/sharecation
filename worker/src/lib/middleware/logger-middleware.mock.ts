import {jest} from '@jest/globals';
import {Logger} from 'workers-loki-logger';
import {LoggerReceiver} from 'workers-loki-logger/build/logger';

class MockLoggerReceiver implements LoggerReceiver {
  debugLogs: any[][] = [];
  errorLogs: any[][] = [];
  infoLogs: any[][] = [];
  warnLogs: any[][] = [];

  debug(...data: any[]): void {
    this.debugLogs.push(data);
  }

  error(...data: any[]): void {
    this.errorLogs.push(data);
  }

  info(...data: any[]): void {
    this.infoLogs.push(data);
  }

  warn(...data: any[]): void {
    this.warnLogs.push(data);
  }
}


export function mockLoggerMiddleware() {
  // @ts-ignore
  console.log(import.meta.url);
  let mockLoggerReceiver = new MockLoggerReceiver();

  jest.unstable_mockModule('../../lib/middleware/logger-middleware', () => ({
    addLoggerContext: (serviceNameParam: any, fn: any) => {
      return (event: any, env: any, cfContext: any) => {
        return fn(event, env, Object.assign(cfContext, {
          logger: new Logger({
            lokiSecret: '',
            stream: {},
            logReceiver: mockLoggerReceiver
          })
        }));
      };
    }
  }));
  return mockLoggerReceiver;
}
