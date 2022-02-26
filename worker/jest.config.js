const { defaults } = require('jest-config')

module.exports = {
  testEnvironment: 'miniflare',
  testMatch: ['**/?(*.)+(spec|test).mjs'],
  testEnvironmentOptions: {
    bindings: {
      ENVIRONMENT: 'testing',
    },
    kvNamespaces: ['COMMON'],
  },
  moduleFileExtensions: ['mjs', ...defaults.moduleFileExtensions],
}
