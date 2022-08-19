import {expect} from '@jest/globals';
import {isNotNullOrUndefined} from '../lib/lib';

function getUrl(request: Request | string) {
  if (typeof request === 'string') {
    return request;
  }
  return request.url;
}

class RequestStub {
  private readonly calls: { request: Request | string, requestInit?: RequestInit | Request }[] = [];

  constructor(
    public readonly urlPattern: URLPattern,
    private readonly handler: (request: Request | string, requestInitr?: RequestInit | Request) => PromiseLike<Response>,
  ) {
  }

  public async handle(request: Request | string, requestInit?: RequestInit | Request) {
    this.calls.push({request, requestInit});
    return this.handler(request, requestInit);
  }

  public wasCalledExactly(times: number = 1) {
    expect(this.calls.length).toBe(times);
  }

  public wasCalled(atLeastTimes: number = 1) {
    expect(this.calls.length).toBeGreaterThanOrEqual(atLeastTimes);
  }

  public getLastJsonBody(): any {
    this.wasCalled();
    return JSON.parse(this.calls[this.calls.length - 1]!.requestInit!.body as string);
  }
}

export class FetchStub {
  private stubs: RequestStub[] = [];

  addStub(urlPattern: URLPattern, handler: (request: Request | string, requestInitr?: RequestInit | Request) => PromiseLike<Response>) {
    const requestStub = new RequestStub(urlPattern, handler);
    this.stubs.push(requestStub);
    return requestStub;
  }

  addStaticStub(urlPattern: URLPattern, response: Response) {
    const requestStub = new RequestStub(urlPattern, async (_1, _2) => response);
    this.stubs.push(requestStub);
    return requestStub;
  }

  getFetch() {
    return async (request: Request | string, requestInitr?: RequestInit | Request) => {
      const stub = this.stubs.find(stub => stub.urlPattern.test(getUrl(request)));
      if (isNotNullOrUndefined(stub)) {
        return stub.handle(request, requestInitr);
      }
      throw new Error(`No stub found for request=${JSON.stringify(request)}, requestInitr=${JSON.stringify(requestInitr)}`);
    };
  }
}
