import {HttpClient} from '@angular/common/http';
import {Component} from '@angular/core';
import {GetPingRequest, GetPingResponse} from './contracts/pings/v1/images';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'sharecation-admin';

  constructor(private readonly http: HttpClient) {
  }

  tesst() {
    const pingRequest = GetPingRequest.encode({
      pingId: 'hello-there'
    }).finish();

    console.log('buffer: ', pingRequest.byteLength);
    console.log(pingRequest)
    console.log(new Uint8Array(pingRequest))
    const res = GetPingRequest.decode(pingRequest);
    console.log('res: ', res);
  }

  send() {
    const pingRequest = GetPingRequest.encode({
      pingId: 'hello-there'
    }).finish();

    this.http.post(
      'https://development.sharecation-ping.donato-wolfisberg.workers.dev',
      new Uint8Array(pingRequest).buffer,
      {
        headers: {
          'Content-Type': 'application/octet-stream',
        },
        responseType: 'arraybuffer'
      }).subscribe((res) => {
       const ress =  GetPingResponse.decode(new Uint8Array(res));
      console.log('pinged', ress);
      console.log('pinged', res);
    },(err) => {
      console.log('error', err);
    });
  }
}
