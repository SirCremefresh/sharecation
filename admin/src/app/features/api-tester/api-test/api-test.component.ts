import {HttpClient} from '@angular/common/http';
import {Component, Input, OnInit} from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import {FieldInfo, RepeatType, ScalarType} from '@protobuf-ts/runtime';
import {DynamicFormConfig} from '../../../shared/dynamic-form/dynamic-form-config.model';
import {ApiTestConfig} from '../api-test-config.model';

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

  constructor(private readonly http: HttpClient) {
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

  execute() {
    let body = null;
    if (this.config.requestType !== null) {
      body = this.form.value.request;
    }
    this.http.post(
      `https://sharecation-${this.config.service}-development.donato-wolfisberg.workers.dev${this.config.path}`,
      body,
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
          // 'Content-Type': 'application/octet-stream',
          // 'Accept': 'application/octet-stream'
        },
        responseType: 'json'
        // responseType: 'arraybuffer'
      }).pipe().subscribe((res) => {
      // const ress = this.config.responseType.fromBinary(new Uint8Array(res));
      this.response = JSON.stringify(res, null, 4);
    });
  }

  suuu($event: any) {
    console.log($event);
    console.log(this.form.value);
  }

  private scalarTypeToFormControlType(scalarType: ScalarType): 'string' | 'number' | 'boolean' {
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
        type: this.scalarTypeToFormControlType(field.T),
        ...baseField
      };
    }

    throw new Error(`Could not map fild of kind: ${field.kind}`);
  }
}
