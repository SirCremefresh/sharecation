import {HttpClient} from '@angular/common/http';
import {Component, Input, OnInit} from '@angular/core';
import {normalizeFieldInfo} from '@protobuf-ts/runtime';
import {GetRightsOfUserResponse, Rights} from '../../../contracts/authentication/v1/authentication';
import {ApiTestConfig} from '../api-test-config.model';

@Component({
  selector: 'app-api-test',
  templateUrl: './api-test.component.html',
  styleUrls: ['./api-test.component.scss']
})
export class ApiTestComponent implements OnInit {
  @Input() config!: ApiTestConfig;
  response: string = '';

  constructor(private readonly http: HttpClient) {
  }

  ngOnInit(): void {
    console.log(this.config.requestType);
    console.log(this.config.responseType);
    console.log(GetRightsOfUserResponse);
    console.log(Rights);
    if (this.config.requestType) {
      for (let field of this.config.requestType.fields) {
        console.log(normalizeFieldInfo(field));
        if (field.kind === 'scalar') {
          console.log(field.T);
        }
      }
    }
  }

  execute() {
    this.http.post(
      `https://sharecation-${this.config.service}-development.donato-wolfisberg.workers.dev${this.config.path}`,
      null,
      {
        headers: {
          'Content-Type': 'application/octet-stream',
          'Accept': 'application/octet-stream'
        },
        responseType: 'arraybuffer'
      }).pipe().subscribe((res) => {
      const ress = this.config.responseType.fromBinary(new Uint8Array(res));
      this.response = JSON.stringify(ress, null, 4);
    }, (err) => {
      console.log(err);
      const ress = this.config.responseType.fromBinary(new Uint8Array(err));
      this.response = JSON.stringify(ress, null, 4);
      console.log('error', err);
    });
  }

}
