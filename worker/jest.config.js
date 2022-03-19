/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'miniflare',
  testMatch: ['**/?(*.)+(spec|test).ts'],
  testEnvironmentOptions: {
    bindings: {
      ENVIRONMENT: 'testing',
    },
    kvNamespaces: ['COMMON'],
  },
};
