import type {MessageType} from '@protobuf-ts/runtime';
import type {BasicError} from '../contracts/errors/v1/errors';
import {BasicError_BasicErrorCode} from '../contracts/errors/v1/errors';
import {logError, logInfo} from './logger';
import {isRequestIdContext} from './middleware/context';
import {responseContainsBasicError} from './protobuf-util';
import {requestIdHeader} from './request-id-header';

export async function callApi<REQUEST_TYPE extends {}, RESPONSE_TYPE extends { response: {} }>(
  requestType: MessageType<REQUEST_TYPE>,
  responseType: MessageType<RESPONSE_TYPE>,
  body: REQUEST_TYPE,
  jwt: string,
  service: string,
  environment: string,
  path: string,
  context: {},
): Promise<RESPONSE_TYPE['response']> {
  logInfo(`Calling API of service=${service} environment=${environment} path=${path}`, context);
  const bodyString = requestType.toJsonString(body);
  try {
    return await fetch(
      `https://sharecation-${service}-${environment}.dowooo.ch${path}`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': `Bearer ${jwt}`,
          ...(isRequestIdContext(context) ? {[requestIdHeader]: context.requestId} : {})
        },
        body: bodyString,
      }
    )
      .then(response => response.json<RESPONSE_TYPE>())
      .then(response => responseType.fromJson(response).response);
  } catch (error) {
    logError(`Error calling API of service=${service} environment=${environment} path=${path} body=${bodyString}`, error, context);
    if (responseContainsBasicError(responseType)) {
      const basicError: BasicError = {
        message: 'An unknown error occurred',
        code: BasicError_BasicErrorCode.INTERNAL,
      };
      return {
        response: {
          oneofKind: 'error',
          error: basicError
        }
      };
    }
    throw new Error('An unknown error occurred', error as ErrorOptions);
  }
}
