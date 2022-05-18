abstract class DoWrapper implements DurableObject {
  async fetch(request: Request): Promise<Response> {
    console.log((this as any).increaseBy({amount: 1}));
    return new Response('');
  }

}

class Counter extends DoWrapper {
  count = 0;

  constructor() {
    super();
  }

  increaseBy({amount}: { amount: number }) {
    console.log('increment by' + amount);
    this.count += amount;
  }

  getCount() {
    return this.count;
  }
}


function fakeFetch(url: string, body: string) {

}

function doOf<E extends {} = never>(id: string): E {
  return new Proxy({} as unknown as E, {
    get(_: E, p: string): any {
      return async () => {
        fakeFetch('https://do.com/' + p, JSON.stringify(arguments));
      };
    }
  });
}


test('sign key', async () => {
  // doOf<Counter>('asd').increaseBy({amount: 1});
console.log(new URL('http://api.cloudflare.com/hasdfsad').pathname)
  // await new Counter().fetch(null as any);

  expect(true).toBeTruthy();
});

