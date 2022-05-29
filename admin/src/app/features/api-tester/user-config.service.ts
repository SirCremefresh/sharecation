import {Injectable} from '@angular/core';
import {Executor} from './executor.model';

type UserConfig = {
  roles: string[];
  userId: string;
};

@Injectable({
  providedIn: 'root'
})
export class UserConfigService {

  constructor() {
    this.setConfig('GET_ROLES', {
      userId: 'get-roles',
      roles: ['admin:roles:read']
    });
  }

  setConfig(configName: Executor, config: UserConfig) {
    localStorage.setItem('user-config:' + configName + ':user-id', config.userId);
    localStorage.setItem('user-config:' + configName + ':roles', JSON.stringify(config.roles));
  }

  getUserConfig(configName: Executor): UserConfig {
    const userId = localStorage.getItem('user-config:' + configName + ':user-id') ??
      crypto.randomUUID();
    const roles = JSON.parse(localStorage.getItem('user-config:' + configName + ':roles') ?? '[]');
    return {
      roles,
      userId
    };
  }
}
