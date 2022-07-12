import {describe, test} from '@jest/globals';
import {build} from 'esbuild';
import {Miniflare} from 'miniflare';

const out = await build({
  entryPoints: ['src/bin/ping/main.ts'],
  outfile: 'src/bin/ping/dist/main2.js',
  bundle: true,
  format: 'esm',
});
console.log(out);
const mf = new Miniflare({
  envPath: true,
  packagePath: true,
  wranglerConfigPath: true,
  modulesRules: [
    { type: "ESModule", include: ["**/*.js"], fallthrough: true },
    { type: "Text", include: ["**/*.txt"] },
  ],
  scriptPath: 'src/bin/ping/dist/main2.js',
  modules: true,
  globals: {SOME_COOL: 'value2'},
});
//
describe('Ping', () => {
  test('Should return pong with given pingId1', async () => {
    await mf.reload();
    const res = await mf.dispatchFetch('http://localhost:8787/').then(res => res.text());
    console.log(res);
  });
});
