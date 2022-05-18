import {LoggerContext, RequestIdContext} from '../middleware/context';
import {addLoggerContext, LoggerConfig} from '../middleware/logger-middleware';
import {onDurableObjectFetch} from '../starter/on-durable-object-fetch';

type Invalid<ERROR_ARRAY> = ERROR_ARRAY & Error;
type DurableObjectMethod = (body: any, context: RequestIdContext & LoggerContext) => Promise<any>;
export type CheckDurableObjectMethods<DURABLE_OBJECT> = {
  [KEY in keyof DURABLE_OBJECT]: DURABLE_OBJECT[KEY] extends Function ?
    (DURABLE_OBJECT[KEY] extends DurableObjectMethod ? DURABLE_OBJECT[KEY] :
      Invalid<['Method: ', KEY, ' is not valid DurableObjectMethod expected: ', DurableObjectMethod, ', received: ', DURABLE_OBJECT[KEY]]>) : DURABLE_OBJECT[KEY]
}


export abstract class DurableObjectWrapper<Env extends LoggerConfig> {
  protected abstract env: Env;
  protected fetch = onDurableObjectFetch<Env>(
    () => this.env,
    addLoggerContext(
      () => this.serviceName,
      async (request, env, context) => {
        const path = new URL(request.url).pathname;
        const methodName = path.startsWith('/') ? path.substring(1) : path;
        const parameters = await request.json<unknown>();
        const callableThis = this as any;
        try {
          const result = await callableThis[methodName](parameters, context);
          return new Response(JSON.stringify(result), {
            status: 200,
            headers: {
              'content-type': 'application/json',
            },
          });
        } catch (error) {
          context.logger.error('An error occurred in durable object', error);
          return new Response(JSON.stringify({reason: 'unknown'}), {
            status: 500,
            headers: {
              'content-type': 'application/json',
            },
          });
        }
      }
    ),
  );

  protected constructor(public readonly serviceName: string) {
  }
}
