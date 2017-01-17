import {Routes} from "@angular/router";

export const routes: Routes = [
  {path: '', pathMatch: 'full', redirectTo: 'home'},
  {path: 'busqueda', loadChildren:'./search/search.module#SearchModule'},
  {path: 'contacto', loadChildren: 'app/contact/contact.module#ContactModule'},
  {path: 'doctorx', loadChildren: 'app/doctor/doctor.module#DoctorModule'},
  {path: 'recursos', loadChildren:'app/resources/resources.module#ResourcesModule'}
]
