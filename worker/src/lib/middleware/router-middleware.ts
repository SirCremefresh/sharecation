import {responseErrReason} from '../lib';
import {LoggerContext, RouteContext} from './context';

type Method = 'GET' | 'POST';

type RouteFunction<REQUEST extends Request,
  ENV,
  CONTEXT,
  RESPONSE> = (
  request: REQUEST,
  env: ENV,
  context: CONTEXT & RouteContext,
) => Promise<RESPONSE>;

interface RouteConfig<ROUTE_FUNCTION> {
  method: Method;
  path: string;
  fn: ROUTE_FUNCTION;
}

export function route<REQUEST extends Request,
  ENV,
  CONTEXT,
  RESPONSE extends Response>(
  method: Method,
  path: string,
  fn: RouteFunction<REQUEST, ENV, CONTEXT, RESPONSE>,
): RouteConfig<RouteFunction<REQUEST, ENV, CONTEXT, RESPONSE>> {
  return {
    method,
    path,
    fn,
  };
}

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Access-Control-Max-Age': '3600',
};

export function addRouter<REQUEST extends Request, ENV, CONTEXT extends LoggerContext, RESPONSE extends Response>(
  routes: Array<RouteConfig<RouteFunction<REQUEST, ENV, CONTEXT, RESPONSE>>>,
) {
  for (const route of routes) {
    route.path = route.path.trim().replace(/\/$/, '');
  }
  return async (request: REQUEST, env: ENV, context: CONTEXT) => {
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        status: 200,
        headers: CORS_HEADERS,
      });
    }

    const url = new URL(request.url);
    let pathname = url.pathname.replace(/\/$/, '');
    for (let routeIndex = 0; routeIndex < routes.length; routeIndex++) {
      const route = routes[routeIndex];
      if (route.method !== request.method) {
        continue;
      }
      if (route.path !== pathname) {
        continue;
      }
      context.logger.info(
        `Handling request for method=${request.method} pathname=${pathname}`,
      );
      return await route.fn(
        request,
        env,
        Object.assign(context, {
          route: {
            url
          }
        }),
      );
    }
    context.logger.info(
      `No route found for method=${request.method} pathname=${pathname}`,
    );
    return responseErrReason('NOT_FOUND', 404);
  };
}
