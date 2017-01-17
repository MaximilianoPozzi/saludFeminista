import {Injectable} from "@angular/core";
import {Http} from "@angular/http";
import {CONFIG} from "../config";
import 'rxjs/add/operator/map';

@Injectable()
export class SearchService{

  constructor(private http: Http){}

  getCitiesByProvince(id: number){
    return this.http.get('/localidades/'+id.toString())
      .map(response => response.json().Localidades);
  }

  getProvinces(){
    return this.http.get('/provincias')
      .map(response => response.json().Provincias);
  }

  queryResults(nombre:string,idLocalidad:number,idProvincia:number){
    return this.http.get('/profesionalesfiltro/nombreapellido/'+nombre+'/localidad/'+idLocalidad+'/provincia/'+idProvincia)
      .map(response => response.json().Profesionales);
  }

}
