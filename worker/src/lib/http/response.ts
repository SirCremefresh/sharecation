import {MessageType} from '@protobuf-ts/runtime';
import {BasicError} from '../../contracts/errors/v1/errors';
import {isProtoBufContext} from '../middleware/context';
import {responseContainsBasicError} from '../protobuf-util';
import {MessageFormat, messageFormatToMediaType} from './types';

export function createProtoBufResponse(
  body: {},
  context: {
    proto: { responseFormat: MessageFormat; responseType: MessageType<{}> };
  },
): Response {
  const protoContext = context.proto;
  const serializedBody =
    protoContext.responseFormat === MessageFormat.PROTOBUF
      ? protoContext.responseType.toBinary(body)
      : protoContext.responseType.toJsonString(body);
  return _createRawResponse(serializedBody, protoContext.responseFormat);
}

export function createBasicErrorResponse(basicError: BasicError, context: {}) {
  if (
    isProtoBufContext(context) &&
    responseContainsBasicError(context.proto.responseType)
  ) {
    return createProtoBufResponse({error: basicError}, context);
  }
  return _createRawResponse(
    JSON.stringify({error: BasicError.toJson(basicError)}),
    MessageFormat.JSON,
  );
}

function _createRawResponse(
  body: string | Uint8Array,
  contentType: MessageFormat,
) {
  return new Response(body, {
    status: 200,
    headers: {
      'Content-Type': messageFormatToMediaType(contentType),
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    },
  });
}
