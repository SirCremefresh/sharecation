export const enum MediaType {
  APPLICATION_OCTET_STREAM = 'application/octet-stream',
  APPLICATION_JSON = 'application/json'
}

export const enum Headers {
  CONTENT_TYPE = 'content-type',
  ACCEPT = 'accept'
}

export const enum MessageFormat {
  JSON = 'JSON',
  PROTOBUF = 'PROTOBUF'
}

export function messageFormatToMediaType(messageFormat: MessageFormat) {
  if (messageFormat === MessageFormat.PROTOBUF) {
    return MediaType.APPLICATION_OCTET_STREAM;
  }
  return MediaType.APPLICATION_JSON;
}
