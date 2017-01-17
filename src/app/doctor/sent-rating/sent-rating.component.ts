import { Component } from '@angular/core';
import {Router} from "@angular/router";

@Component({
  selector: 'app-sent-rating',
  templateUrl: './sent-rating.component.html',
  styleUrls: ['./sent-rating.component.css']
})
export class SentRatingComponent{

  constructor(private router: Router) { }

  goToMainPage(){
    this.router.navigate(['']);
  }

}
