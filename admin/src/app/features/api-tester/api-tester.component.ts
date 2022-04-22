import {Component} from '@angular/core';
import {CreateRightBindingRequest, CreateRightBindingResponse} from '../../contracts/authentication/v1/authentication';
import {GetPublicJwksResponse} from '../../contracts/authentication/v1/public_jwk';
import {CreateUserRequest, CreateUserResponse} from '../../contracts/dev-tools/v1/jwt';
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
      title: 'Create Right Binding',
      service: 'dev-tools',
      description: 'Create A testing User, This only works in development',
      path: '/v1/create-user',
      requestType: CreateRightBindingRequest,
      responseType: CreateRightBindingResponse
    },
  ];
}
