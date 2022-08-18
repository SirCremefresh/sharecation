import {RequestInit} from '@miniflare/core';
import {build} from 'esbuild';
import {Miniflare} from 'miniflare';
import {generateJwt} from '../../lib/authentication/jwt';
import {exportPublicAndPrivateInJwk, generateKeys} from '../authentication-scheduled/generate-sharecation-keys';
import {FetchStub} from './fetch-stub-testing';

class TestRunContainer {
  constructor(
    public readonly publicKey: CryptoKey,
    public readonly privateKey: CryptoKey,
    public readonly publicJkw: JsonWebKey & { kid: string },
    public readonly globalFetchStub: FetchStub,
    public readonly testingContainer: TestingContainer,
  ) {
  }

  async getJwt(options: { roles: string[] }) {
    const {jwtString} = await generateJwt(
      'some',
      options.roles,
      this.privateKey,
      this.publicJkw.kid,
      Math.floor(Date.now() / 1000) + 60 * 60,
    );
    return jwtString;
  }

  dispatchFetch(url: string, options: RequestInit) {
    return this.testingContainer.mf.dispatchFetch(url, options);
  }
}

class TestingContainer {
  constructor(public readonly mf: Miniflare) {
  }

  async initTest() {
    const globalFetchStub = new FetchStub();
    this.addLockiStub(globalFetchStub);
    const {privateKey, publicKey} = await generateKeys();
    const {publicJkw} = await exportPublicAndPrivateInJwk(publicKey, privateKey);

    await this.mf.setOptions({
      globals: {
        TESTING_BASE_CONTEXT: {
          base: {
            fetch: globalFetchStub.getFetch()
          }
        }
      },
      bindings: {
        ENVIRONMENT: 'testing',
        LOKI_SECRET: 'some-secret',
        PUBLIC_KEYS: JSON.stringify([publicJkw])
      },
    });
    return new TestRunContainer(
      publicKey,
      privateKey,
      publicJkw,
      globalFetchStub,
      this
    );
  }

  private addLockiStub(fetchStub: FetchStub) {
    fetchStub.addStub(new URLPattern('https://logs-prod-eu-west-0.grafana.net/loki/api/v1/push'),
      async (request, requestInitr) => {
        return new Response('{}', {status: 200});
      });
  }
}

export async function getTestingContainer(serviceName: string) {
  const buildOutput = await build({
    entryPoints: [`src/bin/${serviceName}/main.ts`],
    bundle: true,
    format: 'esm',
    write: false
  });

  const miniflare = new Miniflare({
    envPath: true,
    packagePath: true,
    wranglerConfigPath: `./src/bin/${serviceName}/wrangler.toml`,
    wranglerConfigEnv: 'development',
    script: buildOutput.outputFiles[0].text,
    modules: true,
    bindings: {
      ENVIRONMENT: 'testing',
      LOKI_SECRET: 'some-secret',
    },
  });
  return new TestingContainer(miniflare);
}

