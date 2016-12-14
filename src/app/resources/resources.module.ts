import {NgModule} from "@angular/core";
import {ResourcesComponent} from "./resources/resources.component";
import {RouterModule} from "@angular/router";
import {routes} from "./resources.routing.module";

@NgModule({
  declarations: [
    ResourcesComponent
  ],
  imports:[
    RouterModule.forChild(routes)
  ]
})

export class ResourcesModule{}
