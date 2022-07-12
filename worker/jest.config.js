/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
export default {
  preset: 'ts-jest/presets/default-esm',
  // testEnvironment: 'miniflare',
  extensionsToTreatAsEsm: ['.ts'],
  globals: {
    'ts-jest': {
      useESM: true,
    },
  },
  moduleNameMapper: {
    '^(\\.{1,2}/.*)\\.js$': '$1',
  },
  testMatch: ['**/?(*.)+(spec|test).ts'],
  testEnvironmentOptions: {
    bindings: {
      ENVIRONMENT: 'testing',
    },
    kvNamespaces: ['COMMON'],
    modules: true
  },
};
