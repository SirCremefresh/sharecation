import {Component, forwardRef, Input, OnInit} from '@angular/core';
import {ControlValueAccessor, FormControl, NG_VALUE_ACCESSOR} from '@angular/forms';
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
export class DynamicFormControlComponent implements OnInit, ControlValueAccessor {
  @Input() config!: DynamicFormConfig;
  public formControl: FormControl = new FormControl();

  constructor() {
  }

  ngOnInit() {
  }

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
