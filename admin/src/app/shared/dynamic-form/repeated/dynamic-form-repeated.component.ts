import {Component, forwardRef, Input, OnInit} from '@angular/core';
import {ControlValueAccessor, FormArray, FormControl, FormGroup, NG_VALUE_ACCESSOR} from '@angular/forms';
import {DynamicFormConfig} from '../dynamic-form-config.model';

@Component({
  selector: 'app-dynamic-form-repeated',
  templateUrl: './dynamic-form-repeated.component.html',
  styleUrls: ['./dynamic-form-repeated.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      useExisting: forwardRef(() => DynamicFormRepeatedComponent),
      multi: true
    }
  ]
})
export class DynamicFormRepeatedComponent implements OnInit, ControlValueAccessor {
  @Input() config!: DynamicFormConfig;
  public formArray = new FormArray([]);
  formGroup = new FormGroup({
    array: this.formArray
  });

  constructor() {
  }

  ngOnInit(): void {
  }

  add() {
    this.formArray.push(new FormControl());
  }

  public onTouched: () => void = () => {
  };

  writeValue(val: any): void {
    console.log(val);
    val && this.formArray.setValue(val, {emitEvent: false});
  }

  registerOnChange(fn: any): void {
    console.log('on change');

    this.formArray.valueChanges.subscribe(fn);
  }

  registerOnTouched(fn: any): void {
    console.log('on blur');
    this.onTouched = fn;
  }

  setDisabledState?(isDisabled: boolean): void {
    isDisabled ? this.formArray.disable() : this.formArray.enable();
  }
}
