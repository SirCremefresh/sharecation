import {expect, jest, test} from '@jest/globals';

export const getRealMagicMock = jest.fn();

jest.unstable_mockModule('./real', () => {
  console.log('getting the mock');

  return ({__esModule: true, getRealMagic: getRealMagicMock});
});

const {getMagic} = await import('./some-fn');



test('test mocking', async () => {
  getRealMagicMock.mockReturnValue(22);

  expect(getMagic()).toEqual(22);
});
