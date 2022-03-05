import {MessageType} from '@protobuf-ts/runtime';
import {createResponse, isNotNullOrUndefined} from '../lib';

export function protoBuf<REQUEST extends Request,
  ENV extends {},
  CONTEXT extends ExecutionContext,
  RESPONSE extends Response,
  REQUEST_BODY extends {},
  RESPONSE_BODY extends {}>(
  requestType: MessageType<REQUEST_BODY> | null,
  responseType: MessageType<RESPONSE_BODY>,
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & { body: REQUEST_BODY },
  ) => Promise<RESPONSE_BODY>,
): (request: REQUEST, env: ENV, context: CONTEXT) => Promise<Response> {
  return async (request: REQUEST, env: ENV, context: CONTEXT): Promise<Response> => {
    let newContext;
    if (isNotNullOrUndefined(requestType)) {
      const buffer = await request.arrayBuffer();
      const uint8Array = new Uint8Array(buffer);
      const requestBody = requestType.fromBinary(uint8Array);
      newContext = Object.assign(context, {
        body: requestBody,
      });
    } else {
      newContext = Object.assign(context, {
        body: {},
      });
    }

    const response = await fn(request, env, newContext as CONTEXT & { body: REQUEST_BODY });

    return createResponse(
      responseType.toBinary(responseType.fromJson(response))
    );
  };
}
