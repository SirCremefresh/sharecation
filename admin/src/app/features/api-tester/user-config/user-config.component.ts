import {COMMA, ENTER} from '@angular/cdk/keycodes';
import {Component, ElementRef, Input, OnInit, ViewChild} from '@angular/core';
import {FormControl} from '@angular/forms';
import {MatAutocompleteSelectedEvent} from '@angular/material/autocomplete';
import {MatChipInputEvent} from '@angular/material/chips';
import {map, Observable, startWith} from 'rxjs';

@Component({
  selector: 'app-user-config',
  templateUrl: './user-config.component.html',
  styleUrls: ['./user-config.component.scss']
})
export class UserConfigComponent implements OnInit {
  @Input() configName: string = '';
  @Input() configDisplayName: string = '';
  separatorKeysCodes: number[] = [ENTER, COMMA];
  rolesControl = new FormControl();
  userIdControl = new FormControl();
  filteredRoles: Observable<string[]>;
  roles: string[] = [];

  ROLES_WITHOUT_PLACEHOLDERS = ['admin:roles:read', 'admin:roles:write', 'admin:roles:delete'];
  ROLES_WITH_PLACEHOLDERS = ['roles:{}:member'];

  @ViewChild('roleInput') roleInput!: ElementRef<HTMLInputElement>;

  constructor() {
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
    this.userIdControl.valueChanges.subscribe(
      (newUserId: string) => {
        localStorage.setItem('user-config:' + this.configName + ':user-id', newUserId);
      }
    );
  }

  ngOnInit(): void {
    const userId = localStorage.getItem('user-config:' + this.configName + ':user-id')
      ?? crypto.randomUUID();
    this.userIdControl.setValue(userId);
    this.roles = JSON.parse(localStorage.getItem('user-config:' + this.configName + ':roles') ?? '[]');
  }

  add(event: MatChipInputEvent): void {
    const value = (event.value || '').trim();
    if (value) {
      this.roles.push(value);
    }
    event.chipInput!.clear();
    this.rolesControl.setValue(null);
    this.saveRoles();
  }

  remove(role: string): void {
    const index = this.roles.indexOf(role);

    if (index >= 0) {
      this.roles.splice(index, 1);
      this.saveRoles();
    }
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    this.roles.push(event.option.viewValue);
    this.roleInput.nativeElement.value = '';
    this.rolesControl.setValue(null);
    this.saveRoles();
  }

  saveRoles(): void {
    localStorage.setItem('user-config:' + this.configName + ':roles', JSON.stringify(this.roles));
  }

  newUserId() {
    this.userIdControl.setValue(crypto.randomUUID());
  }
}
