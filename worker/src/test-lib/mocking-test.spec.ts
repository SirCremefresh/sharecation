import {expect, test} from '@jest/globals';
import {getRealMagicMock} from './real-mock';

const {getMagic} = await import('./some-fn');

test('test mocking', async () => {
  getRealMagicMock.mockReturnValue(22);

  expect(getMagic()).toEqual(22);
});
