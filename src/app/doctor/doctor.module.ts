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
import { QualifyDoctorComponent } from './qualify-doctor/qualify-doctor.component';
import { SentRatingComponent } from './sent-rating/sent-rating.component';

@NgModule({
  declarations:[
    DoctorComponent,
    RatingComponent,
    NewDoctorComponent,
    SentDoctorComponent,
    QualifyDoctorComponent,
    SentRatingComponent
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
