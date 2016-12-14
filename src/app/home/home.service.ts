import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';
import { CONFIG } from '../config';

@Injectable()
export class HomeService {

  constructor( private http: Http ) {}

  getBestRatedDoctors(){
    return this.http.get(CONFIG.baseUrls.bestRatedDoctors)
      .map(response => response.json().doctors);
  }

  getLatestOpinions(){
    return this.http.get(CONFIG.baseUrls.latestOpinions)
      .map(response => response.json().opinions);
  }
}
