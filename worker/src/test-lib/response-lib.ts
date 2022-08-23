import {expect} from '@jest/globals';
import {BasicError} from '../contracts/errors/v1/errors';

type GenericResponse<OK> = {
  response:
    | {
    oneofKind: 'ok';
    ok: OK;
  }
    | {
    oneofKind: 'error';
    error: BasicError;
  }
    | {
    oneofKind: undefined;
  };
};

function expectOk<OK>(
  responseBody: GenericResponse<OK>,
): asserts responseBody is { response: { oneofKind: 'ok'; ok: OK } } {
  expect(responseBody.response.oneofKind).toEqual('ok');
}

export function unwrapOk<E>(responseBody: GenericResponse<E>): E {
  expectOk(responseBody);
  return responseBody.response.ok;
}

function expectError(
  responseBody: GenericResponse<unknown>,
): asserts responseBody is { response: { oneofKind: 'error'; error: BasicError } } {
  expect(responseBody.response.oneofKind).toEqual('error');
}

export function unwrapError(responseBody: GenericResponse<unknown>): BasicError {
  expectError(responseBody);
  return responseBody.response.error;
}
