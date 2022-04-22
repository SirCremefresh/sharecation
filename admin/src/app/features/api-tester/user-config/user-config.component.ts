import {COMMA, ENTER} from '@angular/cdk/keycodes';
import {Component, ElementRef, ViewChild} from '@angular/core';
import {FormControl} from '@angular/forms';
import {MatAutocompleteSelectedEvent} from '@angular/material/autocomplete';
import {MatChipInputEvent} from '@angular/material/chips';
import {map, Observable, startWith} from 'rxjs';

@Component({
  selector: 'app-user-config',
  templateUrl: './user-config.component.html',
  styleUrls: ['./user-config.component.scss']
})
export class UserConfigComponent {
  separatorKeysCodes: number[] = [ENTER, COMMA];
  groupsCtrl = new FormControl();
  filteredGroups: Observable<string[]>;
  groups: string[] = ['USER'];

  GROUPS_WITHOUT_PLACEHOLDERS = ['admin', 'user'];
  GROUPS_WITH_PLACEHOLDERS = ['groups:{}'];

  @ViewChild('groupInput') groupInput!: ElementRef<HTMLInputElement>;

  constructor() {
    this.filteredGroups = this.groupsCtrl.valueChanges.pipe(
      startWith(null),
      map((newGroup: string | null) => {
        if (newGroup) {
          const newGroupUppercase = newGroup.toUpperCase();
          return [newGroupUppercase, ...this.GROUPS_WITH_PLACEHOLDERS.map(group => group.replace('{}', newGroupUppercase)), ...this.GROUPS_WITHOUT_PLACEHOLDERS];
        } else {
          return this.GROUPS_WITHOUT_PLACEHOLDERS.slice();
        }
      }),
    );
  }

  add(event: MatChipInputEvent): void {
    const value = (event.value || '').trim();

    // Add our fruit
    if (value) {
      this.groups.push(value);
    }

    // Clear the input value
    event.chipInput!.clear();

    this.groupsCtrl.setValue(null);
  }

  remove(fruit: string): void {
    const index = this.groups.indexOf(fruit);

    if (index >= 0) {
      this.groups.splice(index, 1);
    }
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    this.groups.push(event.option.viewValue);
    this.groupInput.nativeElement.value = '';
    this.groupsCtrl.setValue(null);
  }
}
