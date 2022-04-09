import {HttpClient} from '@angular/common/http';
import {Component, OnInit} from '@angular/core';
import {GetPublicJwksResponse} from '../../contracts/authentication/v1/public_jwk';

@Component({
  selector: 'app-api-tester',
  templateUrl: './api-tester.component.html',
  styleUrls: ['./api-tester.component.scss']
})
export class ApiTesterComponent implements OnInit {
  response: string = '';

  constructor(private readonly http: HttpClient) {
  }

  ngOnInit(): void {
  }

  execute() {

    this.http.post(
      'https://sharecation-authentication-development.donato-wolfisberg.workers.dev/v1/get-public-jwks',
      null,
      {
        headers: {
          'Content-Type': 'application/octet-stream',
          'Accept': 'application/octet-stream'
        },
        responseType: 'arraybuffer'
      }).pipe().subscribe((res) => {
      const ress = GetPublicJwksResponse.fromBinary(new Uint8Array(res));
      this.response = JSON.stringify(ress, null, 4);
    }, (err) => {
      console.log(err);
      const ress = GetPublicJwksResponse.fromBinary(new Uint8Array(err));
      this.response = JSON.stringify(ress, null, 4);
      console.log('error', err);
    });
  }
}
