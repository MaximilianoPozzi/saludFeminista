import {Injectable} from "@angular/core";
import {Http} from "@angular/http";
import {CONFIG} from "../config";
import 'rxjs/add/operator/map';

@Injectable()
export class SearchService{

  constructor(private http: Http){}

  getCitiesByProvince(id: number){
    return this.http.get(CONFIG.baseUrls.cities)
      .map(response => response.json().citiesByProvince[id.toString()]);
  }

  getProvinces(){
    return this.http.get(CONFIG.baseUrls.provinces)
      .map(response => response.json().provinces);
  }

  queryResults(id: number){
    return this.http.get(CONFIG.baseUrls.results)
      .map(response => response.json().results);
  }

}
