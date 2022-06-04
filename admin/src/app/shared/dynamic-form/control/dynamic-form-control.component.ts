import {Component, forwardRef, Input} from '@angular/core';
import {ControlValueAccessor, UntypedFormControl, NG_VALUE_ACCESSOR} from '@angular/forms';
import {DynamicFormConfig} from '../dynamic-form-config.model';

@Component({
  selector: 'app-dynamic-form-control',
  templateUrl: './dynamic-form-control.component.html',
  styleUrls: ['./dynamic-form-control.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      useExisting: forwardRef(() => DynamicFormControlComponent),
      multi: true
    }
  ]
})
export class DynamicFormControlComponent implements ControlValueAccessor {
  @Input() config!: DynamicFormConfig;
  public formControl: UntypedFormControl = new UntypedFormControl();

  public onTouched: () => void = () => {
  };

  writeValue(val: any): void {
    val && this.formControl.setValue(val, {emitEvent: false});
  }

  registerOnChange(fn: any): void {
    this.formControl.valueChanges.subscribe(fn);
  }

  registerOnTouched(fn: any): void {
    this.onTouched = fn;
  }

  setDisabledState?(isDisabled: boolean): void {
    isDisabled ? this.formControl.disable() : this.formControl.enable();
  }
}
