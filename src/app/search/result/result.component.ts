import {Component, Input} from '@angular/core';
import {Router} from "@angular/router";

@Component({
  selector: 'app-result',
  templateUrl: './result.component.html',
  styleUrls: ['./result.component.css']
})
export class ResultComponent {
  @Input() doctor;
  private valoracionProm: number;
  private valoracionCant: number;

  constructor(private router: Router) { }

  onClick(){
    this.router.navigate(['doctor', this.doctor.id])
  }

}
