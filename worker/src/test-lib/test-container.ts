import {RequestInit} from '@miniflare/core';
import {build} from 'esbuild';
import {Miniflare} from 'miniflare';
import {exportPublicAndPrivateInJwk, generateKeys} from '../bin/authentication-scheduled/generate-sharecation-keys';
import {generateJwt} from '../lib/authentication/jwt';
import {getTypedKVInstance} from '../lib/typed-kv-wrapper/typed-kv-wrapper';
import {FetchStub} from './fetch-stub-testing';

class TestRunContainer {
  constructor(
    public readonly publicKey: CryptoKey,
    public readonly privateKey: CryptoKey,
    public readonly publicJkw: JsonWebKey & { kid: string },
    public readonly globalFetchStub: FetchStub,
    private readonly mf: Miniflare,
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
    return this.mf.dispatchFetch(url, options);
  }

  async post(options: { path: string, body?: string, authenticated?: { roles: string[] } }) {
    const headers: { [key: string]: string } = {};
    if (options.authenticated) {
      const jwtString = await this.getJwt({roles: options.authenticated.roles});
      headers['Authorization'] = `Bearer ${jwtString}`;
    }
    return await this.dispatchFetch(`https://fake.url${options.path}`, {
      method: 'POST',
      body: options.body ?? null,
      headers
    });
  }

  async getKv<KV extends {}>(namespace: string) {
    return getTypedKVInstance<KV>(await this.mf.getKVNamespace(namespace) as KVNamespace);
  }
}

class TestingContainer {
  constructor(private readonly serviceName: string, private readonly script: string) {
  }

  async initTest() {
    const globalFetchStub = new FetchStub();
    this.addLockiStub(globalFetchStub);
    const {privateKey, publicKey} = await generateKeys();
    const {publicJkw} = await exportPublicAndPrivateInJwk(publicKey, privateKey);


    const miniflare = new Miniflare({
      envPath: true,
      packagePath: true,
      wranglerConfigPath: `./src/bin/${this.serviceName}/wrangler.toml`,
      wranglerConfigEnv: 'development',
      script: this.script,
      modules: true,
      bindings: {
        ENVIRONMENT: 'testing',
        LOKI_SECRET: 'some-secret',
        PUBLIC_KEYS: JSON.stringify([publicJkw])
      },
      globals: {
        TESTING_BASE_CONTEXT: {
          base: {
            fetch: globalFetchStub.getFetch()
          }
        }
      },
    });

    return new TestRunContainer(
      publicKey,
      privateKey,
      publicJkw,
      globalFetchStub,
      miniflare,
    );
  }

  private addLockiStub(fetchStub: FetchStub) {
    fetchStub.addStub(new URLPattern('https://logs-prod-eu-west-0.grafana.net/loki/api/v1/push'),
      async (_1, _2) => {
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

  return new TestingContainer(serviceName, buildOutput.outputFiles[0].text);
}

