/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
export default {
  preset: 'ts-jest/presets/default-esm',
  testEnvironment: 'miniflare',
  globals: {
    'ts-jest': {
      useESM: true,
    },
  },
  testMatch: ['**/?(*.)+(spec|test).ts'],
  testEnvironmentOptions: {
    bindings: {
      ENVIRONMENT: 'testing',
    },
    kvNamespaces: ['COMMON'],
  },
};
