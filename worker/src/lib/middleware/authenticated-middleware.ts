import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {DecodedJwt, isExpired, tryDecodeJwt} from '../authentication/jwt';
import {verifyJwt} from '../authentication/sharecation-verify-keys';
import {createBasicErrorResponse} from '../http/response';
import {isNullOrUndefined} from '../lib';
import {AuthenticatedContext, LoggerContext} from './context';

export function addAuthenticatedToContext<CONTEXT>(
  userId: string,
  rights: Set<string>,
  context: CONTEXT,
): CONTEXT & AuthenticatedContext {
  return Object.assign(context, {
    user: {
      userId,
      rights,
    },
  });
}

export function decodeJwtFromAuthorizationHeader(
  request: Request,
  context: LoggerContext,
): DecodedJwt | null {
  const jwtString = request.headers
    .get('Authorization')
    ?.replace('Bearer ', '')
    ?.trim();
  if (isNullOrUndefined(jwtString) || jwtString.length === 0) {
    return null;
  }
  return tryDecodeJwt(jwtString, context);
}

function createUnauthorizedErrorResponse(context: {}): Response {
  return createBasicErrorResponse(
    {
      message: 'Authentication was unsuccessful',
      code: BasicError_BasicErrorCode.UNAUTHENTICATED,
    },
    context,
  );
}

export function addAuthenticationGuard<REQUEST extends Request,
  ENV extends { PUBLIC_KEYS: string },
  CONTEXT extends LoggerContext,
  RESPONSE extends Response,
  >(
  fn: (
    request: REQUEST,
    env: ENV,
    context: CONTEXT & AuthenticatedContext,
  ) => Promise<RESPONSE>,
) {
  return async (request: REQUEST, env: ENV, context: CONTEXT) => {
    const jwt = decodeJwtFromAuthorizationHeader(request, context);
    if (isNullOrUndefined(jwt)) {
      context.logger.error('Could not get JWT from authorization header');
      return createUnauthorizedErrorResponse(context);
    }

    const valid = await verifyJwt(jwt, env.PUBLIC_KEYS, context);
    if (!valid) {
      context.logger.error(
        `Jwt is not valid. payload: ${JSON.stringify(jwt.payload)}`,
      );
      return createUnauthorizedErrorResponse(context);
    }

    if (isExpired(jwt)) {
      context.logger.error(
        `Jwt is expired. payload: ${JSON.stringify(jwt.payload)}`,
      );
      return createUnauthorizedErrorResponse(context);
    }

    return fn(
      request,
      env,
      addAuthenticatedToContext(
        jwt.payload.sub,
        new Set(jwt.payload.rights),
        context,
      ),
    );
  };
}
