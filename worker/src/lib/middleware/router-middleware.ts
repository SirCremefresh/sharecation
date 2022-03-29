import {BasicError_BasicErrorCode} from '../../contracts/errors/v1/errors';
import {createBasicErrorResponse} from '../http/response';
import {isNotNullOrUndefined} from '../lib';
import {LoggerContext, RouteContext} from './context';

type Method = 'GET' | 'POST' | 'DELETE';

type ParamConfig = {
  paramName: string;
};

type RouteFunction<REQUEST extends Request,
  ENV,
  CONTEXT,
  RESPONSE> = (
  request: REQUEST,
  env: ENV,
  context: CONTEXT & RouteContext,
) => Promise<RESPONSE>;

interface RouteConfig<ENV,
  CONTEXT,
  ROUTE_FUNCTION> {
  method: Method;
  path: Array<ParamConfig | string>;
  fn: ROUTE_FUNCTION;
}

export function route<REQUEST extends Request,
  ENV,
  CONTEXT, RESPONSE extends Response>(
  method: Method,
  path: Array<ParamConfig | string>,
  fn: RouteFunction<REQUEST, ENV, CONTEXT, RESPONSE>,
): RouteConfig<ENV, CONTEXT, RouteFunction<REQUEST, ENV, CONTEXT, RESPONSE>> {
  return {
    method,
    path,
    fn,
  };
}

export function pathParam(paramName: string): ParamConfig {
  return {paramName};
}

function checkRouteMatchAndParseContext(
  routeSegments: Array<ParamConfig | string>,
  urlSegments: string[],
  path: string
): null | RouteContext {
  if (routeSegments.length !== urlSegments.length) {
    return null;
  }
  const params = {};
  for (
    let segmentIndex = 0;
    segmentIndex < routeSegments.length;
    segmentIndex++
  ) {
    const routeSegment = routeSegments[segmentIndex];
    const urlSegment = urlSegments[segmentIndex];
    if (typeof routeSegment === 'string') {
      if (routeSegment !== urlSegment) {
        return null;
      }
    } else {
      Object.assign(params, {[routeSegment.paramName]: urlSegment});
    }
  }
  return {
    route: {
      path,
      params,
    },
  };
}

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Access-Control-Max-Age': '3600',
};

export function addRouter<REQUEST extends Request, ENV, CONTEXT extends LoggerContext, RESPONSE extends Response>(
  routes: RouteConfig<ENV,
    CONTEXT,
    RouteFunction<REQUEST, ENV, CONTEXT, RESPONSE>>[],
) {
  return async (request: REQUEST, env: ENV, context: CONTEXT) => {
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        status: 200,
        headers: CORS_HEADERS,
      });
    }

    let pathname = new URL(request.url).pathname;
    const urlSegments = pathname
      .split('/')
      .map(s => s.trim())
      .filter(s => s.length > 0);
    for (let routeIndex = 0; routeIndex < routes.length; routeIndex++) {
      const route = routes[routeIndex];
      if (route.method !== request.method) {
        continue;
      }
      let routeContext = checkRouteMatchAndParseContext(
        route.path,
        urlSegments,
        pathname
      );
      if (isNotNullOrUndefined(routeContext)) {
        context.logger.info(
          `Handling request for method=${request.method} pathname=${pathname}`,
        );
        return await route.fn(
          request,
          env,
          Object.assign(context, routeContext),
        );
      }
    }
    const notFoundErrorMessage = `No route found for method=${request.method} pathname=${pathname}`;
    context.logger.info(notFoundErrorMessage);
    return createBasicErrorResponse({
      message: notFoundErrorMessage,
      code: BasicError_BasicErrorCode.NOT_FOUND
    }, context);
  };
}
