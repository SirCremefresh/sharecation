import {HttpClient} from '@angular/common/http';
import {Component} from '@angular/core';
import {GetPingRequest, GetPingResponse} from './contracts/pings/v1/pings';

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
    const aa = GetPingRequest.create({
      pingId: 'hello-there'
    });

    const pingRequest = GetPingRequest.toBinary(aa);

    console.log('buffer: ', pingRequest.byteLength);
  }

  send() {
    const aa = GetPingRequest.create({
      pingId: 'hello-there'
    });

    const pingRequest = GetPingRequest.toBinary(aa);

    console.log('buffer: ', pingRequest);

    this.http.post(
      'https://development.sharecation-ping.donato-wolfisberg.workers.dev',
      pingRequest.buffer,
      {
        headers: {
          'Content-Type': 'application/octet-stream',
          'Accept': 'application/octet-stream'
        },
        responseType: 'arraybuffer'
      }).pipe().subscribe((res) => {
      const ress = GetPingResponse.fromBinary(new Uint8Array(res));
      console.log('pinged', ress);
    }, (err) => {
      console.log('error', err);
    });
  }
}
