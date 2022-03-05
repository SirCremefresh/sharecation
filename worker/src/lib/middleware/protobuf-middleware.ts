import {MessageType} from '@protobuf-ts/runtime';
import {createResponse, isNotNullOrUndefined} from '../lib';

export function protoBuf<REQUEST_BODY extends {},
  RESPONSE_BODY extends {},
  ENV extends {} = {},
  REQUEST extends Request = Request,
  CONTEXT extends ExecutionContext = ExecutionContext,
  RESPONSE extends Response = Response>(
  requestType: MessageType<REQUEST_BODY> | null,
  responseType: MessageType<RESPONSE_BODY>,
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & { body: REQUEST_BODY },
  ) => Promise<RESPONSE_BODY>,
) {
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
