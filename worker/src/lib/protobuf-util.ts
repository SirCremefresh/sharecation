import { MessageType } from '@protobuf-ts/runtime';
import { BasicError } from '../contracts/errors/v1/errors';
import { isNullOrUndefined } from './lib';

export function responseContainsBasicError(
  responseType: MessageType<{}>,
): boolean {
  const errorType = responseType.fields.find((field) => field.name === 'error');
  if (isNullOrUndefined(errorType) || errorType.kind !== 'message') {
    return false;
  }
  return errorType.T() === BasicError;
}
