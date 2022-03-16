import {MessageType} from '@protobuf-ts/runtime';
import {BasicError} from '../../contracts/errors/v1/errors';
import {isNullOrUndefined} from '../lib';
import {isProtoBufContext} from '../middleware/context';
import {MessageFormat, messageFormatToMediaType} from './types';


export function createProtobufResponse(body: {}, context: { proto: { responseFormat: MessageFormat, responseType: MessageType<any> } }): Response {
  const protoContext = context.proto;
  const serializedBody = protoContext.responseFormat === MessageFormat.PROTOBUF
    ? protoContext.responseType.toBinary(protoContext.responseType.fromJson(body))
    : protoContext.responseType.toJsonString(protoContext.responseType.fromJson(body));
  return createResponse(serializedBody, protoContext.responseFormat);
}

function createResponse(body: string | Uint8Array, contentType: MessageFormat, status: number = 200) {
  return new Response(body, {
    status,
    headers: {
      'Content-Type': messageFormatToMediaType(contentType),
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    },
  });
}

function responseContainsBasicError(responseType: MessageType<any>): boolean {
  const errorType = responseType.fields.find(field => field.name === 'error');
  if (isNullOrUndefined(errorType) || errorType.kind !== 'message') {
    return false;
  }
  return errorType.T() === BasicError;
}

export function createBasicErrorResponse(basicError: BasicError, context: {}) {
  const wrappedBody = {error: basicError};
  if (isProtoBufContext(context) && responseContainsBasicError(context.proto.responseType)) {
    return createProtobufResponse(wrappedBody, context);
  }
  return createResponse(JSON.stringify(wrappedBody), MessageFormat.JSON, 500);
}
