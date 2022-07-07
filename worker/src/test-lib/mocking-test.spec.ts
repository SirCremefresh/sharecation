import {expect, test} from '@jest/globals';
import {mockedMagic} from './real.mock';
import {getMagic} from './some-fn';

test('test mocking', async () => {
  mockedMagic.mockReturnValue(22);

  expect(getMagic()).toEqual(22);
});
