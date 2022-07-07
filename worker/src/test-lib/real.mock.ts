import {jest} from '@jest/globals';

export const mockedMagic = jest.fn();

jest.mock('./real.ts', () => ({magic: mockedMagic}));
