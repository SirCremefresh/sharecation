import {logError} from './logger';

function mockLoggerContext() {
  const errorCalls: Array<[string, any]> = [];
  const loggerContext = {
    logger: {
      error: function () {
        errorCalls.push(arguments as unknown as [string, any]);
      },
    }
  };
  return {errorCalls, loggerContext};
}

test('logError without error object should call loggerContext', async () => {
  const {errorCalls, loggerContext} = mockLoggerContext();
  jest.spyOn(console, 'error').mockImplementation();

  logError('some-message', loggerContext);

  expect(errorCalls).toHaveLength(1);
  expect(errorCalls[0][0]).toEqual('some-message');
  expect(errorCalls[0][1]).toEqual(undefined);
  expect(console.error).toBeCalledTimes(0);
});

test('logError with error object should call loggerContext', async () => {
  const {errorCalls, loggerContext} = mockLoggerContext();
  jest.spyOn(console, 'error').mockImplementation();
  const error = new Error('some-error');

  logError('some-message', error, loggerContext);

  expect(errorCalls).toHaveLength(1);
  expect(errorCalls[0][0]).toEqual('some-message');
  expect(errorCalls[0][1]).toEqual(error);
  expect(console.error).toBeCalledTimes(0);
});

test('logError without loggerContext should log to console', async () => {
  jest.spyOn(console, 'error').mockImplementation();

  logError('some-message', {});

  expect(console.error).toBeCalledTimes(1);
  expect(console.error).toBeCalledWith('some-message error=undefined', undefined);
});
