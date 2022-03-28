export class TypedKvNamespace<E> {
  constructor(
    public readonly keys: E,
    public readonly namespace: KVNamespace,
  ) {
  }
}

