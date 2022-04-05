import { Headers, MediaType, MessageFormat } from './types';

export function getResponseFormat(request: Request): MessageFormat {
  const acceptHeader = request.headers.get(Headers.ACCEPT);
  return mediaTypeToMessageFormat(acceptHeader);
}

export function getRequestFormat(request: Request): MessageFormat {
  const contentType = request.headers.get(Headers.CONTENT_TYPE);
  return mediaTypeToMessageFormat(contentType);
}

function mediaTypeToMessageFormat(contentType: string | null) {
  if (contentType === MediaType.APPLICATION_OCTET_STREAM) {
    return MessageFormat.PROTOBUF;
  }
  return MessageFormat.JSON;
}
