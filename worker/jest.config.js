/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
export default {
  extensionsToTreatAsEsm: ['.ts'],
  moduleNameMapper: {
    '^(\\.{1,2}/.*)\\.js$': '$1',
  },
  transform: {
    '.*.ts': [
      'ts-jest',
      {
        useESM: true,
      },
    ],
  },
  testMatch: ['**/?(*.)+(spec|test).ts'],
};
