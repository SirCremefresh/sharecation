import {HttpClient} from '@angular/common/http';
import {Component, Input, OnInit} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {FieldInfo, RepeatType, ScalarType} from '@protobuf-ts/runtime';
import {DynamicFormConfig} from '../../../shared/dynamic-form/dynamic-form-config.model';
import {ApiTestConfig} from '../api-test-config.model';
import {ApiTesterService} from '../api-tester.service';
import {Executor} from '../executor.model';
import {UserConfigService} from '../user-config.service';

@Component({
  selector: 'app-api-test',
  templateUrl: './api-test.component.html',
  styleUrls: ['./api-test.component.scss']
})
export class ApiTestComponent implements OnInit {
  @Input() config!: ApiTestConfig;
  response: string = '';

  dynamicFormConfig?: DynamicFormConfig;

  form = new FormGroup({
    request: new FormControl()
  });

  constructor(
    private readonly http: HttpClient,
    private readonly userConfigService: UserConfigService,
    private readonly apiTesterService: ApiTesterService) {
  }

  ngOnInit(): void {
    if (this.config.requestType) {
      this.dynamicFormConfig = {
        formType: 'group',
        name: 'root',
        repeated: false,
        children: this.config.requestType.fields.map(field => this.fieldToDynamicFormConfig(field))
      };
    }
  }

  async execute(executor: Executor) {
    const res = await this.apiTesterService.execute(this.config, executor, this.form.value.request);
    this.response = JSON.stringify(res, null, 4);
  }

  private static scalarTypeToFormControlType(scalarType: ScalarType): 'string' | 'number' | 'boolean' {
    if (scalarType === ScalarType.STRING) {
      return 'string';
    }
    if ([ScalarType.FLOAT,
      ScalarType.INT32,
      ScalarType.DOUBLE,
      ScalarType.FIXED32,
      ScalarType.FIXED64,
      ScalarType.INT64].includes(scalarType)) {
      return 'number';
    }
    if (scalarType === ScalarType.BOOL) {
      return 'boolean';
    }
    throw new Error(`Could not convert scalarType: ${scalarType}`);
  }

  private fieldToDynamicFormConfig(field: FieldInfo): DynamicFormConfig {
    const baseField = {
      name: field.jsonName,
      repeated: field.repeat !== RepeatType.NO
    };
    if (field.kind === 'message') {
      const childType = field.T();
      return {
        formType: 'group',
        children: childType.fields.map(field => this.fieldToDynamicFormConfig(field)),
        ...baseField
      };
    }
    if (field.kind === 'scalar') {
      return {
        formType: 'field',
        type: ApiTestComponent.scalarTypeToFormControlType(field.T),
        ...baseField
      };
    }
    throw new Error(`Could not map field of kind: ${field.kind}`);
  }
}
