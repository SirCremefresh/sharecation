import { TestingContext } from '../lib/middleware/context';

export function buildFakeContext(): ExecutionContext & TestingContext {
  return {
    async waitUntil(promise: Promise<any>) {
      await promise;
    },
    passThroughOnException() {},
    test: true,
  };
}
