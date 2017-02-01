import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
import { CONFIG } from '../config';

@Injectable()
export class HomeService {

  constructor( private http: Http ) {}

  getLatestDoctors(){
    return this.http.get('/ultimosAgregados')
      .map(response => response.json().Profesionales);
  }

  getBestReatedDoctors(){
    return this.http.get('/mejoresValoraciones')
      .map(response => response.json().Profesionales);
  }
  getLatestOpinions(){
    return this.http.get('/ultimasValoraciones')
      .map(response => response.json().Profesionales);

  }

  getAvarageRaitingDoctor(id: number){
    return this.http.get('/valoracion/'+id)
      .map(response => response.json().Valoracion);
  }


}
