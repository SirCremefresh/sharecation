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

  logError('some-message', loggerContext);

  expect(errorCalls).toHaveLength(1);
  expect(errorCalls[0][0]).toEqual('some-message');
  expect(errorCalls[0][1]).toEqual(undefined);
});

test('logError with error object should call loggerContext', async () => {
  const {errorCalls, loggerContext} = mockLoggerContext();
  const error = new Error('some-error');

  logError('some-message', error, loggerContext);

  expect(errorCalls).toHaveLength(1);
  expect(errorCalls[0][0]).toEqual('some-message');
  expect(errorCalls[0][1]).toEqual(error);
});
