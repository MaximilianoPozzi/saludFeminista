import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
import { CONFIG } from '../config';

@Injectable()
export class HomeService {

  constructor( private http: Http ) {}

  getBestRatedDoctors(){
    return this.http.get('/ultimasValoraciones')
      .map(response => response.json().Profesionales);
  }

  getLatestOpinions(){
    return this.http.get('/ultimosComentarios')
      .map(response => response.json().Profesionales);

  }
}
