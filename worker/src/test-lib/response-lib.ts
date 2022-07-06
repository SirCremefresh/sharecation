import { expect } from '@jest/globals';
import { BasicError } from '../contracts/errors/v1/errors';

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
