import { Component } from '@angular/core';
import {Router} from "@angular/router";

@Component({
  selector: 'app-sent-form',
  templateUrl: './sent-form.component.html',
  styleUrls: ['./sent-form.component.css']
})
export class SentFormComponent{

  constructor(private router: Router) { }

  onClick(){
    this.router.navigate(['']);
  }

}
