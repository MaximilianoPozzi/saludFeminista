import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import { ReactiveFormsModule} from '@angular/forms';

import { DoctorComponent } from './doctor/doctor.component';
import { DoctorService } from './doctor.service';

import {RouterModule} from "@angular/router";
import {routes} from "./doctor.routing.module";
import { RatingComponent } from './rating/rating.component';
import { NewDoctorComponent } from './new-doctor/new-doctor.component';
import { SentDoctorComponent } from './sent-doctor/sent-doctor.component';

@NgModule({
  declarations:[
    DoctorComponent,
    RatingComponent,
    NewDoctorComponent,
    SentDoctorComponent
  ],
  imports:[
    CommonModule,
    ReactiveFormsModule,
    RouterModule.forChild(routes)
  ],
  providers:[
    DoctorService
  ]
})

export class DoctorModule{}
