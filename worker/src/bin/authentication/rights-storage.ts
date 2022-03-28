export class RightsStorage {
  constructor(private state: DurableObjectState, env: {}) {
  }

  // Handle HTTP requests from clients.
  async fetch(request: Request) {
    // Apply requested action.

    // Durable Object storage is automatically cached in-memory, so reading the
    // same key every request is fast. (That said, you could also store the
    // value in a class member if you prefer.)
    let value = await this.state.storage.get<number>('value') ?? 0;

    ++value;

    // You do not have to worry about a concurrent request having modified the
    // value in storage because "input gates" will automatically protect against
    // unwanted concurrency. So, read-modify-write is safe. For more details,
    // refer to: https://blog.cloudflare.com/durable-objects-easy-fast-correct-choose-three/
    await this.state.storage.put('value', value);

    return new Response(`${value}`);
  }
}
