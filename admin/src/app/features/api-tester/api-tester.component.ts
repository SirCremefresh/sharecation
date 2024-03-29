import {Component} from '@angular/core';
import {
  CreateRoleBindingRequest,
  CreateRoleBindingResponse,
  DeleteRoleBindingRequest,
  DeleteRoleBindingResponse,
  GetRolesOfUserRequest,
  GetRolesOfUserResponse
} from '../../contracts/authentication/v1/authentication';
import {GetPublicJwksResponse} from '../../contracts/authentication/v1/public_jwk';
import {CreateUserRequest, CreateUserResponse} from '../../contracts/dev-tools/v1/jwt';
import {CreateGroupRequest, CreateGroupResponse, GetGroupsResponse} from '../../contracts/groups/v1/groups';
import {GetImagesByGroupIdRequest, GetImagesByGroupIdResponse} from '../../contracts/images/v1/images';
import {GetPingRequest, GetPingResponse} from '../../contracts/pings/v1/pings';
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
      title: 'Delete Role Binding',
      service: 'authentication',
      description: 'Delete a role binding',
      path: '/v1/delete-role-binding',
      requestType: DeleteRoleBindingRequest,
      responseType: DeleteRoleBindingResponse
    },
    {
      title: 'Create Group',
      service: 'groups',
      description: 'Create a new group and add user as member',
      path: '/v1/create-group',
      requestType: CreateGroupRequest,
      responseType: CreateGroupResponse
    },
    {
      title: 'Get Groups',
      service: 'groups',
      description: 'Get all groups of user',
      path: '/v1/get-groups',
      requestType: null,
      responseType: GetGroupsResponse
    },
    {
      title: 'Get Images by groupId',
      service: 'images',
      description: 'Get all images of group',
      path: '/v1/get-images-by-group-id',
      requestType: GetImagesByGroupIdRequest,
      responseType: GetImagesByGroupIdResponse
    },
    {
      title: 'Ping Pong',
      service: 'ping',
      description: 'Sample resource to test client',
      path: '/v1/get-ping',
      requestType: GetPingRequest,
      responseType: GetPingResponse
    },
  ];
}
