import {Routes} from "@angular/router";

export const routes: Routes = [
  {path: '', pathMatch: 'full', redirectTo: 'home'},
  {path: 'contacto', loadChildren: 'app/contact/contact.module#ContactModule'},
  {path: 'info-de-consulta', loadChildren:'app/resources/resources.module#ResourcesModule'}
]
