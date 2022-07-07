import {jest} from '@jest/globals';

export const getRealMagicMock = jest.fn();

jest.unstable_mockModule('./real', () => ({getRealMagic: getRealMagicMock}));
