import {HttpClientModule} from '@angular/common/http';
import {NgModule} from '@angular/core';
import {ReactiveFormsModule} from '@angular/forms';
import {MatButtonModule} from '@angular/material/button';
import {MatExpansionModule} from '@angular/material/expansion';
import {MatInputModule} from '@angular/material/input';
import {BrowserModule} from '@angular/platform-browser';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {ApiTestComponent} from './features/api-tester/api-test/api-test.component';
import {ApiTesterComponent} from './features/api-tester/api-tester.component';
import {DynamicFormControlComponent} from './shared/dynamic-form/control/dynamic-form-control.component';
import { DynamicFormGroupComponent } from './shared/dynamic-form/group/dynamic-form-group.component';
import { DynamicFormRepeatedComponent } from './shared/dynamic-form/repeated/dynamic-form-repeated.component';

@NgModule({
  declarations: [
    AppComponent,
    ApiTesterComponent,
    ApiTestComponent,
    DynamicFormControlComponent,
    DynamicFormGroupComponent,
    DynamicFormRepeatedComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    MatExpansionModule,
    MatButtonModule,
    MatInputModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
}
