import { Injectable } from '@angular/core';
import {Http, Headers, Response} from "@angular/http";
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';
import {Observable} from "rxjs";

@Injectable()
export class ContactService {

  constructor(private http: Http) { }

  sendContactForm(contactForm){
    const body= JSON.stringify(contactForm);
    const headers = new Headers();
    headers.append('Content-Type', 'application/json');

    return this.http.post('', body, {
      headers: headers
    }).map((response: Response) => response.json())
      .catch(this.handleError);
  }

  private handleError(error: Response){
    let msg= `Status code ${error.status} at ${error.url}`;
    console.log(msg);
    return Observable.throw(msg);

  }
}
