import {NgModule} from "@angular/core";
import { SearchComponent } from './search/search.component';
import { ResultsComponent } from './results/results.component';
import {CommonModule} from "@angular/common";

@NgModule({
  declarations: [
    SearchComponent,
    ResultsComponent
  ],
  imports:[
    CommonModule
  ]
})

export class SearchModule{}
