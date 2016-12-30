import {Routes} from "@angular/router";
import {ContactFormComponent} from "./contact-form/contact-form.component";
import {SentFormComponent} from "./sent-form/sent-form.component";

export const routes: Routes = [
  {path: '', redirectTo: 'form'},
  {path: 'formulario', component: ContactFormComponent},
  {path: 'enviado', component: SentFormComponent}
]
