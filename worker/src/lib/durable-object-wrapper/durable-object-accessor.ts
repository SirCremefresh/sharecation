import {isRequestIdContext} from '../middleware/context';
import {requestIdHeader} from '../request-id-header';

type NormalizeDurableObjectMethods<DURABLE_OBJECT> = {
  [KEY in keyof DURABLE_OBJECT]:
  DURABLE_OBJECT[KEY] extends (body: infer FIRST_ARG, ...args: any[]) => infer RETURN_TYPE ? (request: FIRST_ARG) => RETURN_TYPE :
    never
};

export function getDurableObjectInstance<E extends {}>(
  durableObject: { new(...args: any[]): E, serviceName: string },
  durableObjectNamespace: DurableObjectNamespace,
  name: string,
  context: {}): NormalizeDurableObjectMethods<E> {
  return new Proxy({} as unknown as NormalizeDurableObjectMethods<E>, {
    get(_, method: string): any {
      return (argument: any) => {
        const id = durableObjectNamespace.idFromName(name);
        return durableObjectNamespace.get(id).fetch(`https://${durableObject.serviceName}.durable-object/${method}`, {
          body: JSON.stringify(argument),
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            ...(isRequestIdContext(context) ? {[requestIdHeader]: context.requestId} : {})
          }
        }).then(res => res.json());
      };
    }
  });
}
