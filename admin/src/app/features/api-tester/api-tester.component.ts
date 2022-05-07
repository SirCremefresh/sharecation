import {Component} from '@angular/core';
import {
  CreateRoleBindingRequest,
  CreateRoleBindingResponse,
  GetRolesOfUserRequest,
  GetRolesOfUserResponse
} from '../../contracts/authentication/v1/authentication';
import {GetPublicJwksResponse} from '../../contracts/authentication/v1/public_jwk';
import {CreateUserRequest, CreateUserResponse} from '../../contracts/dev-tools/v1/jwt';
import {CreateGroupRequest, CreateGroupResponse} from '../../contracts/groups/v1/groups';
import {ApiTestConfig} from './api-test-config.model';

@Component({
  selector: 'app-api-tester',
  templateUrl: './api-tester.component.html',
  styleUrls: ['./api-tester.component.scss']
})
export class ApiTesterComponent {
  readonly configs: ApiTestConfig[] = [
    {
      title: 'Get Public JWKs',
      service: 'authentication',
      description: 'Get currently active public JWKs.',
      path: '/v1/get-public-jwks',
      requestType: null,
      responseType: GetPublicJwksResponse
    },
    {
      title: 'Create Testing User',
      service: 'dev-tools',
      description: 'Create A testing User, This only works in development',
      path: '/v1/create-user',
      requestType: CreateUserRequest,
      responseType: CreateUserResponse
    },
    {
      title: 'Get Roles of user',
      service: 'authentication',
      description: 'Get roles of specific user user.',
      path: '/v1/get-roles-of-user',
      requestType: GetRolesOfUserRequest,
      responseType: GetRolesOfUserResponse
    },
    {
      title: 'Create Role Binding',
      service: 'authentication',
      description: 'Create A testing User, This only works in development',
      path: '/v1/create-role-binding',
      requestType: CreateRoleBindingRequest,
      responseType: CreateRoleBindingResponse
    },
    {
      title: 'Create Group',
      service: 'groups',
      description: 'Create A testing User, This only works in development',
      path: '/v1/create-group',
      requestType: CreateGroupRequest,
      responseType: CreateGroupResponse
    },
  ];
}
