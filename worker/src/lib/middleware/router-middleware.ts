import {MessageType} from '@protobuf-ts/runtime';
import {isNotNullOrUndefined, responseErrReason} from '../lib';
import {LoggerContext, RouteContext} from './context';

type Method = 'GET' | 'POST';

type ParamConfig<PARAM_NAME extends string> = {
  paramName: PARAM_NAME;
};

type RemoveStringFromTuple<TUPLE extends Array<unknown>> = TUPLE extends [
    infer ITEM,
    ...(infer REST),
  ]
  ? ITEM extends string
    ? RemoveStringFromTuple<REST>
    : [ITEM, ...RemoveStringFromTuple<REST>]
  : [];

type ParamObject<ROUTE extends Array<string | ParamConfig<string>>> = RemoveStringFromTuple<ROUTE>[number] extends ParamConfig<infer PARAM_NAME>
  ? { [key in PARAM_NAME]: string }
  : never;

type RouteFunction<REQUEST extends Request,
  ENV,
  CONTEXT,
  PATH extends Array<ParamConfig<string> | string>,
  RESPONSE> = (
  request: REQUEST,
  env: ENV,
  context: CONTEXT & RouteContext<ParamObject<PATH>>,
) => Promise<RESPONSE>;

interface RouteConfig<ENV,
  CONTEXT,
  PATH extends Array<ParamConfig<string> | string>,
  ROUTE_FUNCTION> {
  method: Method;
  path: PATH;
  fn: ROUTE_FUNCTION;
}

export function onPost<REQUEST extends Request,
  ENV,
  CONTEXT,
  PATH extends Array<ParamConfig<string> | string>,
  REQUEST_BODY extends {},
  RESPONSE_BODY extends {}>(
  path: PATH,
  requestBodyType: MessageType<REQUEST_BODY>,
  responseBodyType: MessageType<RESPONSE_BODY>,
  fn: RouteFunction<REQUEST, ENV, CONTEXT & { body: REQUEST_BODY }, PATH, Promise<RESPONSE_BODY>>,
): RouteConfig<ENV, CONTEXT, PATH, RouteFunction<REQUEST, ENV, CONTEXT, PATH, Response>> {
  return {
    method: 'POST',
    path,
    fn: async (request, env, context) => {
      const buffer = await request.arrayBuffer();
      const uint8Array = new Uint8Array(buffer);
      const body = requestBodyType.fromBinary(uint8Array);

      const response = await fn(request, env, Object.assign(context, {
        body,
      }));

      return new Response(responseBodyType.toBinary(responseBodyType.fromJson(response)));
    },
  };
}

export function route<REQUEST extends Request,
  ENV,
  CONTEXT,
  PATH extends Array<ParamConfig<string> | string>, RESPONSE extends Response>(
  method: Method,
  path: PATH,
  fn: RouteFunction<REQUEST, ENV, CONTEXT, PATH, RESPONSE>,
): RouteConfig<ENV, CONTEXT, PATH, RouteFunction<REQUEST, ENV, CONTEXT, PATH, RESPONSE>> {
  return {
    method: 'POST',
    path,
    fn,
  };
}

export function onGet<REQUEST extends Request,
  ENV,
  CONTEXT,
  PATH extends Array<ParamConfig<string> | string>, RESPONSE extends Response>(
  method: Method,
  path: PATH,
  fn: RouteFunction<REQUEST, ENV, CONTEXT, PATH, RESPONSE>,
): RouteConfig<ENV, CONTEXT, PATH, RouteFunction<REQUEST, ENV, CONTEXT, PATH, RESPONSE>> {
  return {
    method: 'POST',
    path,
    fn,
  };
}

export function routePath<E extends Array<ParamConfig<string> | string>>(
  ...segments: [...E]
): [...E] {
  return segments;
}

export function pathParam<E extends string>(paramName: E): ParamConfig<E> {
  return {paramName};
}

function checkRouteMatchAndParseContext(
  routeSegments: Array<ParamConfig<string> | string>,
  urlSegments: string[],
): null | RouteContext<{}> {
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
      params,
    },
  };
}

export function addRouter<REQUEST extends Request, ENV, CONTEXT extends LoggerContext, RESPONSE extends Response>(
  routes: RouteConfig<ENV,
    CONTEXT,
    Array<ParamConfig<string> | string>,
    RouteFunction<REQUEST, ENV, CONTEXT, Array<ParamConfig<string> | string>, RESPONSE>>[],
) {
  return async (request: REQUEST, env: ENV, context: CONTEXT) => {
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
    context.logger.info(
      `No route found for method=${request.method} pathname=${pathname}`,
    );
    return responseErrReason('NOT_FOUND', 404);
  };
}
