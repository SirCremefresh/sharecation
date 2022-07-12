import {Miniflare} from 'miniflare';
import {describe, test} from '@jest/globals';

const mf = new Miniflare({
  envPath: true,
  packagePath: true,
  wranglerConfigPath: true,
  scriptPath: './src/bin/ping/dist/main.js',
  modules: true,
});
//
describe('Ping', () => {
  test('Should return pong with given pingId1', async () => {
  await mf.reload();
    const res = await mf.dispatchFetch('http://localhost:8787/').then(res => res.text());
    console.log(res)
  });
  test('Should return pong with given pingId2', async () => {
  await mf.reload();
    const res = await mf.dispatchFetch('http://localhost:8787/').then(res => res.text());
    console.log(res)
  });
  test('Should return pong with given pingId3', async () => {
  await mf.reload();
    const res = await mf.dispatchFetch('http://localhost:8787/').then(res => res.text());
    console.log(res)
  });
  test('Should return pong with given pingId4', async () => {
  await mf.reload();
    const res = await mf.dispatchFetch('http://localhost:8787/').then(res => res.text());
    console.log(res)
  });
});
