import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {RouterModule} from "@angular/router";
import {routes} from "./contact.routing.module";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";

import {ContactFormComponent} from "./contact-form/contact-form.component";
import {SentFormComponent} from './sent-form/sent-form.component';
import {ContactService} from "./contact.service";

@NgModule({
  declarations: [
    ContactFormComponent,
    SentFormComponent
  ],
  imports:[
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule.forChild(routes)
  ],
  providers: [
    ContactService
  ]
})

export class ContactModule{}
