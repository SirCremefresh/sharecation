import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {MessageType} from '@protobuf-ts/runtime';
import {JsonValue} from '@protobuf-ts/runtime/build/types/json-typings';
import {firstValueFrom, map} from 'rxjs';
import {CreateUserResponse} from '../../contracts/dev-tools/v1/jwt';
import {ApiTestConfig} from './api-test-config.model';
import {Executor} from './executor.model';
import {UserConfigService} from './user-config.service';

type ExtractTypeFromMessageType<E> = E extends MessageType<infer TYPE> ? TYPE : never

type WireFormat = 'json' | 'proto'

@Injectable({
  providedIn: 'root'
})
export class ApiTesterService {
  private requestFormat: WireFormat = 'json';
  private responseFormat: WireFormat = 'json';


  constructor(private readonly http: HttpClient, private readonly userConfigService: UserConfigService) {
  }

  private static buildUrl(apiConfig: ApiTestConfig) {
    return `https://sharecation-${apiConfig.service}-development.donato-wolfisberg.workers.dev${apiConfig.path}`;
  }

  async execute<E extends ApiTestConfig>(apiConfig: E, executor: Executor, payload: ExtractTypeFromMessageType<E['requestType']>): Promise<ExtractTypeFromMessageType<E['responseType']>['response']> {
    let body = this.getRequestBody(apiConfig, payload);
    let jwt = null;
    if (executor !== 'UNAUTHENTICATED') {
      const {userId, roles} = this.userConfigService.getUserConfig(executor);
      jwt = await this.getTokenForUser(roles, userId);
    }
    if (this.responseFormat === 'json') {
      return await this.executeResponseJson(apiConfig, body, jwt);
    } else {
      return await this.executeResponseProto(apiConfig, body, jwt);
    }
  }

  setRequestFormat(value: WireFormat) {
    this.requestFormat = value;
  }

  setResponseFormat(value: WireFormat) {
    this.responseFormat = value;
  }

  private getRequestBody(apiConfig: ApiTestConfig, payload: any) {
    if (apiConfig.requestType === null) {
      return null;
    } else if (this.requestFormat === 'json') {
      return apiConfig.requestType.toJson(payload);
    } else {
      return apiConfig.requestType.toBinary(payload).buffer;
    }
  }

  private async executeResponseJson(apiConfig: ApiTestConfig, body: any, jwt: string | null) {
    return await firstValueFrom(
      this.http.post<JsonValue>(
        ApiTesterService.buildUrl(apiConfig),
        body,
        {
          headers: {
            'Content-Type': this.getContentType(),
            'Accept': 'application/json',
            ...(jwt !== null ? {'Authorization': `Bearer ${jwt}`} : {})
          },
          responseType: 'json'
        }).pipe(
        map(response => apiConfig.responseType.fromJson(response).response)
      ));
  }

  private async executeResponseProto(apiConfig: ApiTestConfig, body: any, jwt: string | null) {
    return await firstValueFrom(
      this.http.post(
        ApiTesterService.buildUrl(apiConfig),
        body,
        {
          headers: {
            'Content-Type': this.getContentType(),
            'Accept': 'application/octet-stream',
            ...(jwt !== null ? {'Authorization': `Bearer ${jwt}`} : {})
          },
          responseType: 'arraybuffer'
        }).pipe(
        map(response => apiConfig.responseType.fromBinary(new Uint8Array(response)).response)
      ));
  }

  private getContentType() {
    return this.requestFormat === 'json' ? 'application/json' : 'application/octet-stream';
  }

  private async getTokenForUser(roles: string[], userId: string): Promise<string> {
    const response = await firstValueFrom(
      this.http.post<JsonValue>(
        `https://sharecation-dev-tools-development.donato-wolfisberg.workers.dev/v1/create-user`,
        {
          roles,
          userId
        },
        {
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          responseType: 'json'
        }).pipe(
        map(response => CreateUserResponse.fromJson(response).response)
      ));
    if (response.oneofKind === 'ok') {
      return response.ok.jwtString;
    } else {
      console.error('Could not create user. response:', response);
      throw new Error(`Could not create user. response: ${JSON.stringify(response)}`);
    }
  }
}
