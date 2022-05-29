import {ClipboardModule} from '@angular/cdk/clipboard';
import {HttpClientModule} from '@angular/common/http';
import {NgModule} from '@angular/core';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {MatAutocompleteModule} from '@angular/material/autocomplete';
import {MatButtonModule} from '@angular/material/button';
import {MatChipsModule} from '@angular/material/chips';
import {MatExpansionModule} from '@angular/material/expansion';
import {MatIconModule} from '@angular/material/icon';
import {MatInputModule} from '@angular/material/input';
import {MatRadioModule} from '@angular/material/radio';
import {BrowserModule} from '@angular/platform-browser';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {ApiTestComponent} from './features/api-tester/api-test/api-test.component';
import {ApiTesterComponent} from './features/api-tester/api-tester.component';
import {DynamicFormControlComponent} from './shared/dynamic-form/control/dynamic-form-control.component';
import { DynamicFormGroupComponent } from './shared/dynamic-form/group/dynamic-form-group.component';
import { DynamicFormRepeatedComponent } from './shared/dynamic-form/repeated/dynamic-form-repeated.component';
import { UserConfigComponent } from './features/api-tester/user-config/user-config.component';
import { SelectWireTypeComponent } from './features/api-tester/select-wire-type/select-wire-type.component';

@NgModule({
  declarations: [
    AppComponent,
    ApiTesterComponent,
    ApiTestComponent,
    DynamicFormControlComponent,
    DynamicFormGroupComponent,
    DynamicFormRepeatedComponent,
    UserConfigComponent,
    SelectWireTypeComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    FormsModule,
    MatExpansionModule,
    MatButtonModule,
    MatInputModule,
    MatChipsModule,
    MatAutocompleteModule,
    MatIconModule,
    MatRadioModule,
    ClipboardModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
}
