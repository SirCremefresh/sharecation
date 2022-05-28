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

@Injectable({
  providedIn: 'root'
})
export class ApiTesterService {

  constructor(private readonly http: HttpClient, private readonly userConfigService: UserConfigService) {
  }

  private static buildUrl(apiConfig: ApiTestConfig) {
    return `https://sharecation-${apiConfig.service}-development.donato-wolfisberg.workers.dev${apiConfig.path}`;
  }

  async execute<E extends ApiTestConfig>(apiConfig: E, executor: Executor, payload: ExtractTypeFromMessageType<E['requestType']>): Promise<ExtractTypeFromMessageType<E['responseType']>['response']> {
    const body = apiConfig.requestType === null ? null : apiConfig.requestType.toJson(payload);
    let jwt = null;
    if (executor !== 'UNAUTHENTICATED') {
      const {userId, roles} = this.userConfigService.getUserConfig(executor);
      jwt = await this.getTokenForUser(roles, userId);
    }
    return await firstValueFrom(
      this.http.post<JsonValue>(
        ApiTesterService.buildUrl(apiConfig),
        body,
        {
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            ...(jwt !== null ? {'Authorization': `Bearer ${jwt}`} : {})
          },
          responseType: 'json'
        }).pipe(
        map(response => apiConfig.responseType.fromJson(response).response)
      ));
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
