import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {JsonValue} from '@protobuf-ts/runtime/build/types/json-typings';
import {firstValueFrom, map} from 'rxjs';
import {CreateUserResponse} from '../../contracts/dev-tools/v1/jwt';

type UserConfig = {
  roles: string[];
  userId: string;
};

@Injectable({
  providedIn: 'root'
})
export class UserConfigService {

  constructor(private readonly http: HttpClient) {
    this.setConfig('get-roles', {
      userId: 'get-roles',
      roles: ['admin:roles:read']
    });
  }

  setConfig(configName: string, config: UserConfig) {
    localStorage.setItem('user-config:' + configName + ':user-id', config.userId);
    localStorage.setItem('user-config:' + configName + ':roles', JSON.stringify(config.roles));
  }

  getUserConfig(configName: string): UserConfig {
    const userId = localStorage.getItem('user-config:' + configName + ':user-id') ??
      crypto.randomUUID();
    const roles = JSON.parse(localStorage.getItem('user-config:' + configName + ':roles') ?? '[]');
    return {
      roles,
      userId
    };
  }

  async getToken(configName: string): Promise<string> {
    const {roles, userId} = this.getUserConfig(configName);
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
      throw new Error(JSON.stringify(response));
    }
  }
}
