import {Routes} from "@angular/router";
import {DoctorComponent} from "./doctor/doctor.component";
import {NewDoctorComponent} from "./new-doctor/new-doctor.component";
import {SentDoctorComponent} from "./sent-doctor/sent-doctor.component";

export const routes: Routes= [
  {path: '', pathMatch: 'full', redirectTo: 'new'},
  {path: 'enviado', component: SentDoctorComponent},
  {path: 'nuevo', component: NewDoctorComponent},
  {path: ':id', component: DoctorComponent}
]
