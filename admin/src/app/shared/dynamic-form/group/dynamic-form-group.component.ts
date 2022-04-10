import {Component, forwardRef, Input, OnInit} from '@angular/core';
import {ControlValueAccessor, FormControl, FormGroup, NG_VALUE_ACCESSOR} from '@angular/forms';
import {DynamicFormConfig, DynamicFormConfigGroup} from '../dynamic-form-config.model';

@Component({
  selector: 'app-dynamic-form-group',
  templateUrl: './dynamic-form-group.component.html',
  styleUrls: ['./dynamic-form-group.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      useExisting: forwardRef(() => DynamicFormGroupComponent),
      multi: true
    }
  ]
})
export class DynamicFormGroupComponent implements OnInit, ControlValueAccessor {
  public formGroup: FormGroup = new FormGroup({});

  _config!: DynamicFormConfigGroup;

  @Input()
  set config(value: DynamicFormConfig) {
    if (value.formType !== 'group') {
      throw new Error('wrong config type for group. config: ' + JSON.stringify(this._config));
    }
    this._config = value;
  }

  ngOnInit() {
    for (let child of this._config.children) {
      this.formGroup.addControl(child.name, new FormControl());
    }
  }

  public onTouched: () => void = () => {
  };

  writeValue(val: any): void {
    val && this.formGroup.setValue(val, {emitEvent: false});
  }

  registerOnChange(fn: any): void {
    console.log('on change');
    this.formGroup.valueChanges.subscribe(fn);
  }

  registerOnTouched(fn: any): void {
    console.log('on blur');
    this.onTouched = fn;
  }

  setDisabledState?(isDisabled: boolean): void {
    isDisabled ? this.formGroup.disable() : this.formGroup.enable();
  }
}
