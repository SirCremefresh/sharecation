import {MessageType} from '@protobuf-ts/runtime';
import {BasicError} from '../../contracts/errors/v1/errors';
import {isNullOrUndefined} from '../lib';
import {isProtoBufContext} from '../middleware/context';
import {MessageFormat, messageFormatToMediaType} from './types';


export function createProtoBufResponse(body: {}, context: { proto: { responseFormat: MessageFormat, responseType: MessageType<any> } }): Response {
  const protoContext = context.proto;
  const serializedBody = protoContext.responseFormat === MessageFormat.PROTOBUF
    ? protoContext.responseType.toBinary(body)
    : protoContext.responseType.toJsonString(body);
  return _createRawResponse(serializedBody, protoContext.responseFormat);
}

export function createBasicErrorResponse(basicError: BasicError, context: {}) {
  const wrappedBody = {error: basicError};
  if (isProtoBufContext(context) && _responseContainsBasicError(context.proto.responseType)) {
    return createProtoBufResponse(wrappedBody, context);
  }
  return _createRawResponse(JSON.stringify(wrappedBody), MessageFormat.JSON, 500);
}

function _responseContainsBasicError(responseType: MessageType<any>): boolean {
  const errorType = responseType.fields.find(field => field.name === 'error');
  if (isNullOrUndefined(errorType) || errorType.kind !== 'message') {
    return false;
  }
  return errorType.T() === BasicError;
}

function _createRawResponse(body: string | Uint8Array, contentType: MessageFormat, status: number = 200) {
  return new Response(body, {
    status,
    headers: {
      'Content-Type': messageFormatToMediaType(contentType),
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    },
  });
}
