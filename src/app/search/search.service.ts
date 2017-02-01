import {Injectable} from "@angular/core";
import {Http} from "@angular/http";
import {CONFIG} from "../config";
import 'rxjs/add/operator/map';
import { Observable } from 'rxjs/Rx';

@Injectable()
export class SearchService{

  constructor(private http: Http){}

  getCitiesByProvince(id: number){
    return this.http
      .get('/localidades/'+id.toString())
      .map(response => response.json().Localidades)
      .catch(handleError);
  }

  getProvinces(){
    return this.http.get('/provincias')
      .map(response => response.json().Provincias)
      .catch(handleError);
  }

  getEspecialidades(){
    return this.http.get('/especialidades')
      .map(response => response.json().Especialidades)
      .catch(handleError);
  }
  queryResults(nombre:string,idLocalidad:number,idProvincia:number, idEspecialidad:number){
    return this.http.get('/profesionalesfiltro/nombreapellido/'+nombre+'/localidad/'+idLocalidad+'/provincia/'+idProvincia+'/especialidad/'+idEspecialidad)
      .map(response => response.json().Profesionales)
      .catch(handleError);
  }

  getValoracionProfesional(id: number){
    console.log("pidiendo valoracion" + id )
    return this.http
      .get('/valoracionpromedio/'+id)
      .map(response => response.json().Valoracion)
      .catch(handleError);
  }



}

 function handleError (error: any) {
  let errorMsg = error.message || 'Se produjo un error al intentar establecer una conexion con la base de datos'
  console.error(errorMsg);
  return Observable.throw(errorMsg);
}
