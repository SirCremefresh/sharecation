import {MessageType} from '@protobuf-ts/runtime';
import {BasicError, BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {getRequestFormat, getResponseFormat} from '../http/request';
import {createProtobufBasicErrorResponse, createProtobufResponse} from '../http/response';
import {MessageFormat} from '../http/types';
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

export function protoBuf<REQUEST extends Request,
  ENV extends {},
  CONTEXT extends LoggerContext,
  RESPONSE extends Response,
  REQUEST_BODY extends {},
  RESPONSE_BODY extends {}>(
  requestType: MessageType<REQUEST_BODY>,
  responseType: MessageType<RESPONSE_BODY>,
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & ProtoBufContext<REQUEST_BODY>,
  ) => Promise<RESPONSE_BODY>,
): (request: REQUEST, env: ENV, context: CONTEXT) => Promise<Response> {
  return async (request: REQUEST, env: ENV, context: CONTEXT): Promise<Response> => {
    let requestBody;
    let responseFormat = getResponseFormat(request);
    let requestFormat = getRequestFormat(request);
    if (requestFormat === MessageFormat.PROTOBUF) {
      const buffer = await request.arrayBuffer();
      const uint8Array = new Uint8Array(buffer);
      requestBody = requestType.fromBinary(uint8Array);
    } else {
      requestBody = requestType.fromJson(await request.json());
      if (!requestType.is(requestBody)) {
        context.logger.error(`Request body does not match schema. ${requestBody}`);
      }
    }

    // const basicError: BasicError = {
    //   message: 'Could not parse requestBody',
    //   code: BasicError_BasicErrorCode.BAD_REQUEST
    // };
    // return createResponse(convertBody(responseType, {error: basicError}, responseFormat));

    const protobufContext: ProtoBufContext<REQUEST_BODY> = {
      proto: {
        body: requestBody,
        responseType,
        requestType,
        responseFormat,
        requestFormat
      },
    };
    const newContext = Object.assign(context, protobufContext) as CONTEXT & ProtoBufContext<REQUEST_BODY>;

    try {
      const response = await fn(request, env, newContext);
      return createProtobufResponse(response, newContext);
    } catch (e) {
      context.logger.fatal(`An unknown error occurred while handling the request. requestBody=${requestBody} error=${e}`);
      const basicError: BasicError = {
        message: 'An unknown error occurred',
        code: BasicError_BasicErrorCode.UNKNOWN
      };
      return createProtobufBasicErrorResponse(basicError, newContext);
    }
  };
}
