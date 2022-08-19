export function isNullOrUndefined(val: unknown): val is null | undefined {
  return val === null || val === undefined;
}

export function isNotNullOrUndefined<T>(val: T | null | undefined): val is T {
  return val !== null && val !== undefined;
}

export function assertNotNullOrUndefined<T>(
  value: T,
  message = 'Expected non-null/undefined value'
): asserts value is NonNullable<T> {
  if (isNullOrUndefined(value)) {
    throw new Error(`ASSERTION ERROR${isNotNullOrUndefined(message) ? `: ${message}` : ''}`);
  }
}
