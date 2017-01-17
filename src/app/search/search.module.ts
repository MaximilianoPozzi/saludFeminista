import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {RouterModule} from "@angular/router";
import {ReactiveFormsModule} from '@angular/forms';

import { SearchComponent } from './search/search.component';
import { ResultsComponent } from './results/results.component';
import { ResultComponent } from './result/result.component';

import {routes} from "./search.routing.module";
import {SearchService} from "./search.service";


@NgModule({
  declarations: [
    SearchComponent,
    ResultsComponent,
    ResultComponent,
  ],
  imports:[
    CommonModule,
    ReactiveFormsModule,
    RouterModule.forChild(routes)
  ],
  providers:[
    SearchService
  ]
})

export class SearchModule{}
