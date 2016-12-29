import {Routes} from "@angular/router";

export const routes: Routes = [
  {path: '', pathMatch: 'full', redirectTo: 'home'},
  {path: 'busqueda', loadChildren: 'app/search/search.module#SearchModule'},
  {path: 'contacto', loadChildren: 'app/contact/contact.module#ContactModule'},
  {path: 'doctor', loadChildren: 'app/doctor/doctor.module#DoctorModule'},
  {path: 'info-de-consulta', loadChildren:'app/resources/resources.module#ResourcesModule'}
]
