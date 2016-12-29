import { Component } from '@angular/core';
import {Router} from "@angular/router";

@Component({
  selector: 'app-sent-doctor',
  templateUrl: './sent-doctor.component.html',
  styleUrls: ['./sent-doctor.component.css']
})
export class SentDoctorComponent{

  constructor(private router: Router) { }

  onClick(){
    this.router.navigate(['']);
  }

}
