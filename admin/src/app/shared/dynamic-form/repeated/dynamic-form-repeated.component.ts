import {Component, forwardRef, Input} from '@angular/core';
import {ControlValueAccessor, FormArray, FormControl, FormGroup, NG_VALUE_ACCESSOR} from '@angular/forms';
import {NOOP_FN} from '../../../util/noop';
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
export class DynamicFormRepeatedComponent implements ControlValueAccessor {
  @Input() config!: DynamicFormConfig;
  public formArray = new FormArray([]);
  formGroup = new FormGroup({
    array: this.formArray
  });
  public onTouched = NOOP_FN;

  add() {
    this.formArray.push(new FormControl());
  }

  writeValue(val: any): void {
    val && this.formArray.setValue(val, {emitEvent: false});
  }

  registerOnChange(fn: any): void {
    this.formArray.valueChanges.subscribe(fn);
  }

  registerOnTouched(fn: any): void {
    this.onTouched = fn;
  }

  setDisabledState(isDisabled: boolean): void {
    isDisabled ? this.formGroup.disable() : this.formGroup.enable();
  }
}
