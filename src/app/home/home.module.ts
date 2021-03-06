import {CommonModule} from '@angular/common';
import {NgModule} from "@angular/core";
import {RouterModule} from "@angular/router";
import {routes} from "./home.routing.module";

import {HomeService} from "./home.service";

import { BestRatedDoctorsComponent } from './best-rated-doctors/best-rated-doctors.component';
import { BestRatedDoctorComponent } from './best-rated-doctor/best-rated-doctor.component';
import { LatestOpinionComponent } from './latest-opinion/latest-opinion.component';
import { LatestOpinionsComponent } from "./latest-opinions/latest-opinions.component";
import { HomeComponent } from "./home/home.component";
import { LatestProfesionalComponent} from './latest-profesional/latest-profesional.component';
import { LatestProfesionalsComponent } from './latest-profesionals/latest-profesionals.component';


@NgModule({
  declarations:[
    BestRatedDoctorComponent,
    BestRatedDoctorsComponent,
    HomeComponent,
    LatestOpinionsComponent,
    LatestOpinionComponent,
    LatestProfesionalComponent,
    LatestProfesionalsComponent,
  ],
  imports: [
    CommonModule,
    RouterModule.forChild(routes)
  ],
  providers: [
    HomeService
  ]
})

export class HomeModule{}
