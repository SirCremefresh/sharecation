import {BaseContext} from '../middleware/context';

declare global {
  // noinspection ES6ConvertVarToLetConst
  var TESTING_BASE_CONTEXT: BaseContext | undefined | null;
}
export const BASE_CONTEXT: BaseContext = {
  base: {
    fetch: (request: Request | string,
            requestInitr?: RequestInit | Request) => fetch(request, requestInitr),
  }
};
