import {Injectable} from "@angular/core";
import {Http, Headers, Response} from "@angular/http";
import {CONFIG} from "../config";
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';
import {Observable} from "rxjs";

@Injectable()
export class DoctorService{
  constructor(private http: Http){}

  getDoctor(){
    return this.http.get(CONFIG.baseUrls.doctor)
      .map(response => response.json().doctor);
  }

  sendNewDoctor(newDoctorData: any){
    const body= JSON.stringify(newDoctorData);
    const headers= new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('', body, {
      headers: headers
    }).map((response: Response) => response.json())
      .catch(this.handleError);
  }

  sendRating(newRating: any){
    const body = JSON.stringify(newRating);
    const headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('', body, {
      headers: headers
    }).map((response: Response)=> response.json())
      .catch(this.handleError);
  }

  private handleError(error: Response){
    let msg = `Status code ${error.status} on url ${error.url}`;
    console.log(msg);
    return Observable.throw(msg);
  }

}
