import {MessageType} from '@protobuf-ts/runtime';

export interface ApiTestConfig {
  title: string;
  service: string;
  path: string;
  description: string;
  requestType: MessageType<any> | null,
  responseType: MessageType<any>
}
