import {MessageType} from '@protobuf-ts/runtime';
import {BasicError, BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {createResponse, isNotNullOrUndefined, isNullOrUndefined, responseJsonErrorReason} from '../lib';
import {LoggerContext, ProtoBufContext} from './context';

export function createProtoBufOkResponse<TYPE>(data: TYPE): {
  response: {
    oneofKind: 'ok',
    ok: TYPE
  }
} {
  return {
    response: {
      oneofKind: 'ok',
      ok: data
    }
  };
}

export function createProtoBufBasicErrorResponse(message: string, code: BasicError_BasicErrorCode): {
  response: {
    oneofKind: 'error',
    error: BasicError
  }
} {
  return {
    response: {
      oneofKind: 'error',
      error: {
        message,
        code
      }
    }
  };
}

function responseContainsBasicError(responseType: MessageType<any>): boolean {
  const errorType = responseType.fields.find(field => field.name === 'error');
  if (isNullOrUndefined(errorType) || errorType.kind !== 'message') {
    return false;
  }
  return errorType.T() === BasicError;
}

export function protoBuf<REQUEST extends Request,
  ENV extends {},
  CONTEXT extends LoggerContext,
  RESPONSE extends Response,
  REQUEST_BODY extends {},
  RESPONSE_BODY extends {}>(
  requestType: MessageType<REQUEST_BODY> | null,
  responseType: MessageType<RESPONSE_BODY>,
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & ProtoBufContext<REQUEST_BODY>,
  ) => Promise<RESPONSE_BODY>,
): (request: REQUEST, env: ENV, context: CONTEXT) => Promise<Response> {
  return async (request: REQUEST, env: ENV, context: CONTEXT): Promise<Response> => {
    let requestBody = {};
    let responseFormat = getResponseFormat(request);
    if (isNotNullOrUndefined(requestType)) {
      const buffer = await request.arrayBuffer();
      const uint8Array = new Uint8Array(buffer);
      requestBody = requestType.fromBinary(uint8Array);
    }
    const newContext = Object.assign(context, {
      proto: {body: requestBody},
    });

    try {
      const response = await fn(request, env, newContext as CONTEXT & ProtoBufContext<REQUEST_BODY>);
      return createResponse(
        responseType.toBinary(responseType.fromJson(response))
      );
    } catch (e) {
      context.logger.fatal(`An unknown error occurred while handling the request. requestBody=${requestBody} error=${e}`);
      if (responseContainsBasicError(responseType)) {
        const basicError: BasicError = {
          message: 'An unknown error occurred',
          code: BasicError_BasicErrorCode.UNKNOWN
        };
        return createResponse(convertBody(responseType, {error: basicError}, responseFormat));
      }
      return responseJsonErrorReason('UNKNOWN', 500);
    }
  };
}

function getResponseFormat(request: Request): 'protobuf' | 'json' {
  const acceptHeader = request.headers.get('Accept');
  if (acceptHeader === 'application/octet-stream') {
    return 'protobuf';
  }
  return 'json';
}

function convertBody(responseType: MessageType<any>, body: any, format: 'protobuf' | 'json'): string | Uint8Array {
  if (format === 'protobuf') {
    return responseType.toBinary(responseType.fromJson(body));
  }
  return responseType.toJsonString(responseType.fromJson(body));
}
