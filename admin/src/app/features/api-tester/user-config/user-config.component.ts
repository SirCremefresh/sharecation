import {COMMA, ENTER} from '@angular/cdk/keycodes';
import {Component, ElementRef, Input, OnInit, ViewChild} from '@angular/core';
import {FormControl} from '@angular/forms';
import {MatAutocompleteSelectedEvent} from '@angular/material/autocomplete';
import {MatChipInputEvent} from '@angular/material/chips';
import {map, Observable, startWith} from 'rxjs';
import {GetRolesOfUserRequest, GetRolesOfUserResponse} from '../../../contracts/authentication/v1/authentication';
import {ApiTesterService} from '../api-tester.service';
import {Executor} from '../executor.model';
import {UserConfigService} from '../user-config.service';

@Component({
  selector: 'app-user-config',
  templateUrl: './user-config.component.html',
  styleUrls: ['./user-config.component.scss']
})
export class UserConfigComponent implements OnInit {
  @Input() configName!: Executor;
  @Input() configDisplayName: string = '';
  separatorKeysCodes: number[] = [ENTER, COMMA];
  rolesControl = new FormControl();
  userIdControl = new FormControl();
  filteredRoles: Observable<string[]>;
  roles: string[] = [];

  ROLES_WITHOUT_PLACEHOLDERS = ['admin:roles:read', 'admin:roles:write', 'admin:roles:delete'];
  ROLES_WITH_PLACEHOLDERS = ['groups:{}:member'];

  @ViewChild('roleInput') roleInput!: ElementRef<HTMLInputElement>;

  constructor(
    private readonly userConfigService: UserConfigService,
    private readonly apiTesterService: ApiTesterService,
  ) {
    this.filteredRoles = this.rolesControl.valueChanges.pipe(
      startWith(null),
      map((newRole: string | null) => {
        if (newRole) {
          const newRoleUppercase = newRole.toLocaleLowerCase();
          return [newRoleUppercase, ...this.ROLES_WITH_PLACEHOLDERS.map(role => role.replace('{}', newRoleUppercase)), ...this.ROLES_WITHOUT_PLACEHOLDERS];
        } else {
          return this.ROLES_WITHOUT_PLACEHOLDERS.slice();
        }
      }),
    );
  }

  ngOnInit(): void {
    const {userId, roles} = this.userConfigService.getUserConfig(this.configName);
    this.userIdControl.setValue(userId);
    this.roles = roles;
    this.userIdControl.valueChanges.subscribe(() => this.updateConfig());
  }

  add(event: MatChipInputEvent): void {
    const value = (event.value || '').trim();
    if (value) {
      this.roles.push(value);
    }
    event.chipInput!.clear();
    this.rolesControl.setValue(null);
    this.updateConfig();
  }

  remove(role: string): void {
    const index = this.roles.indexOf(role);

    if (index >= 0) {
      this.roles.splice(index, 1);
      this.updateConfig();
    }
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    this.roles.push(event.option.viewValue);
    this.roleInput.nativeElement.value = '';
    this.rolesControl.setValue(null);
    this.updateConfig();
  }

  newUserId() {
    this.userIdControl.setValue(crypto.randomUUID());
  }

  async loadRoles() {
    const request: GetRolesOfUserRequest = {
      userId: this.userIdControl.value,
    };
    const response = await this.apiTesterService.execute(getRolesEndpointConfig, 'GET_ROLES', request);
    if (response.oneofKind === 'ok') {
      this.roles = response.ok.roles;
      this.updateConfig();
    } else {
      throw new Error(JSON.stringify(response));
    }
  }

  private updateConfig() {
    this.userConfigService.setConfig(this.configName, {
      userId: this.userIdControl.value,
      roles: this.roles
    });
  }
}

const getRolesEndpointConfig = {
  title: 'Get Roles of user',
  service: 'authentication',
  description: 'Get roles of specific user user.',
  path: '/v1/get-roles-of-user',
  requestType: GetRolesOfUserRequest,
  responseType: GetRolesOfUserResponse
};
