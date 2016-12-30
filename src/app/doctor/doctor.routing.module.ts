import {Routes} from "@angular/router";
import {DoctorComponent} from "./doctor/doctor.component";
import {NewDoctorComponent} from "./new-doctor/new-doctor.component";
import {SentDoctorComponent} from "./sent-doctor/sent-doctor.component";
import {QualifyDoctorComponent} from "./qualify-doctor/qualify-doctor.component";
import {SentRatingComponent} from "./sent-rating/sent-rating.component";

export const routes: Routes= [
  {path: '', pathMatch: 'full', redirectTo: 'nuevo'},
  {path: 'calificar/:id', children:[
    {path: '', component: QualifyDoctorComponent},
    {path: 'enviado', component: SentRatingComponent}
  ]},
  {path: 'nuevo', children:[
    {path: '', component: NewDoctorComponent},
    {path: 'enviado', component: SentDoctorComponent}
  ]},
  {path: ':id', component: DoctorComponent}
]

