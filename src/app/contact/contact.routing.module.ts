import {Routes} from "@angular/router";
import {ContactFormComponent} from "./contact-form/contact-form.component";
import {SentFormComponent} from "./sent-form/sent-form.component";

export const routes: Routes = [
  {path: '', redirectTo: 'form'},
  {path: 'form', component: ContactFormComponent},
  {path: 'sent', component: SentFormComponent}
]
