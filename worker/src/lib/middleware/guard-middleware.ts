import {responseErrForbidden} from '../lib';
import {isLoggerContext} from './context';

interface SomeMiddleware<REQUEST, ENV, CONTEXT, RESPONSE, NEW_RESPONSE> {
  route: (fn: (request: REQUEST, env: ENV, context: CONTEXT) => Promise<RESPONSE>) => (request: REQUEST, env: ENV, context: CONTEXT) => Promise<NEW_RESPONSE>;
}

class AKL<REQUEST extends Request, ENV, CONTEXT, RESPONSE extends Response> implements SomeMiddleware<REQUEST, ENV, CONTEXT, RESPONSE, Response> {
  route(fn: (request: REQUEST, env: ENV, context: CONTEXT) => Promise<RESPONSE>) {
    return async (request: REQUEST, env: ENV, context: CONTEXT) => {
      await fn(request, env, context);
      return new Response('');
    };
  }
}

export interface UnaryFunction<T, R> {
  (source: T): R;
}

export interface OperatorFunction<REQUEST, ENV, CONTEXT, RESPONSE, NEW_RESPONSE, REQUEST2, ENV2, CONTEXT2, RESPONSE2, NEW_RESPONSE2> extends UnaryFunction<T, R> {
}


function middleware<A, B>(op1: OperatorFunction<A, B>): Promise<B>;
function middleware<A, B, C>(op1: OperatorFunction<A, B>, op2: OperatorFunction<B, C>): Promise<C>;
function middleware<A, B, C, D>(op1: OperatorFunction<A, B>, op2: OperatorFunction<B, C>, op3: OperatorFunction<C, D>): Promise<D>;
function middleware(...operations: OperatorFunction<any, any>[]): any {
  return async (request: Request): Promise<Response> => {

    for (let operation of operations) {
      operation;
    }

    let result = payload;
    for (let i = 0; i < operations.length - 1; i++) {
      result = await operations[i].aa(result);
    }
    return result.response!;
  };
}

middleware(new AKL(), new AKL());

export function addGuard<REQUEST extends Request,
  ENV,
  CONTEXT,
  RESPONSE extends Response>(
  guard: (request: REQUEST, env: ENV, context: CONTEXT) => boolean,
  fn: (request: REQUEST, env: ENV, context: CONTEXT) => Promise<RESPONSE>,
): (request: REQUEST, env: ENV, context: CONTEXT) => Promise<Response> {
  return async (request: REQUEST, env: ENV, context: CONTEXT) => {
    let allowed;
    try {
      allowed = guard(request, env, context);
    } catch (e) {
      if (isLoggerContext(context)) {
        context.logger.error(`Failed to execute guard ${e}`);
      }
      throw e;
    }
    if (allowed) {
      return fn(request, env, context);
    } else {
      return responseErrForbidden();
    }
  };
}
