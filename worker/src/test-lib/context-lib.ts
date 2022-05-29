export function buildFakeContext(): ExecutionContext {
  return {
    async waitUntil(promise: Promise<any>) {
      await promise;
    },
    passThroughOnException() {
    }
  };
}
