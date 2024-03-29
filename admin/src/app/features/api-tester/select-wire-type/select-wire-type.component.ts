import {Component} from '@angular/core';
import {ApiTesterService} from '../api-tester.service';

@Component({
  selector: 'app-select-wire-type',
  templateUrl: './select-wire-type.component.html',
  styleUrls: ['./select-wire-type.component.scss']
})
export class SelectWireTypeComponent {


  constructor(private readonly apiTesterService: ApiTesterService) {
  }

  requestFormatChanged(value: 'json' | 'proto') {
    this.apiTesterService.setRequestFormat(value);
  }

  responseFormatChanged(value: 'json' | 'proto') {
    this.apiTesterService.setResponseFormat(value);
  }

}
