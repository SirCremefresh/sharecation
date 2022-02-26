// test/index.spec.mjs

// When using `format = "modules"`, bindings are included in the `env` parameter,
// which we don't have access to in tests. Miniflare therefore provides a custom
// global method to access these.
// import {exportImportTest, hello} from './main';

declare const getMiniflareBindings: () => { [key: string]: KVNamespace };

const { COMMON } = getMiniflareBindings();

test('sign key', async () => {
  // const res = await hello();
  // await exportImportTest();
  // console.log(res);
  // expect(res).toBeTruthy();
});

// test('should increment the count', async () => {
//   // Seed the KV namespace
//   await COUNTER_NAMESPACE.put('a', '3');
//
//   // Perform the increment
//   const newValue = await increment(COUNTER_NAMESPACE, 'a');
//   const storedValue = await COUNTER_NAMESPACE.get('a');
//
//   // Check the return value of increment
//   expect(newValue).toBe(4);
//   // Check increment had the side effect of updating KV
//   expect(storedValue).toBe('4');
// });
//
// test('should return new count', async () => {
//   // Note we're using Worker APIs in our test, without importing anything extra
//   const request = new Request('http://localhost/a');
//   const response = await worker.fetch(request, {COUNTER_NAMESPACE});
//
//   // Each test gets its own isolated storage environment, so the changes to "a"
//   // are *undone* automatically. This means at the start of this test, "a"
//   // wasn't in COUNTER_NAMESPACE, so it defaulted to 0, and the count is now 1.
//   expect(await response.text()).toBe('count for /a is now 1');
// });
