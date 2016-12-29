import {Routes} from "@angular/router";
import {SearchComponent} from "./search/search.component";
import {ResultsComponent} from "./results/results.component";

export const routes: Routes =[
  {path: '', pathMatch: 'full', component: SearchComponent},
  {path: 'resultados', component: ResultsComponent}
];
