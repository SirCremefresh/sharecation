const { defaults } = require('jest-config')

module.exports = {
  testEnvironment: 'miniflare',
  testMatch: ['**/?(*.)+(spec|test).ts'],
  testEnvironmentOptions: {
    bindings: {
      ENVIRONMENT: 'testing',
    },
    kvNamespaces: ['COMMON'],
  },
  moduleFileExtensions: ['js', ...defaults.moduleFileExtensions],
}
