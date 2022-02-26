import {DecodedJwt, isExpired, tryDecodeJwt} from '../authentication/jwt';
import {verifyJwt} from '../authentication/sharecation-verify-keys';
import {isNullOrUndefined} from '../lib';
import {AuthenticatedContext, LoggerContext} from './context';

const UNAUTHORIZED = JSON.stringify({
  reason: 'UNAUTHORIZED',
});

export function addAuthenticatedToContext<CONTEXT>(
  userId: string,
  rights: Set<string>,
  context: CONTEXT,
): CONTEXT & AuthenticatedContext {
  return Object.assign(context, {
    user: {
      userId,
      rights
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

export function addAuthenticationGuard<REQUEST extends Request,
  ENV extends { COMMON: KVNamespace },
  CONTEXT extends LoggerContext,
  RESPONSE extends Response>(
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
      return new Response(UNAUTHORIZED, {
        status: 401,
      });
    }

    const valid = await verifyJwt(jwt, env.COMMON, context);
    if (!valid) {
      context.logger.error(
        `Jwt is not valid. payload: ${JSON.stringify(jwt.payload)}`,
      );
      return new Response(UNAUTHORIZED, {
        status: 401,
      });
    }

    if (isExpired(jwt)) {
      context.logger.error(
        `Jwt is expired. payload: ${JSON.stringify(jwt.payload)}`,
      );
      return new Response(UNAUTHORIZED, {
        status: 401,
      });
    }

    return fn(
      request,
      env,
      addAuthenticatedToContext(jwt.payload.sub, new Set(jwt.payload.rights), context),
    );
  };
}
