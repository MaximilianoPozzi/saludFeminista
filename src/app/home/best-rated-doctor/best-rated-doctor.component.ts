import {Component, Input} from '@angular/core';

@Component({
  selector: 'app-best-rated-doctor',
  templateUrl: './best-rated-doctor.component.html',
  styleUrls: ['./best-rated-doctor.component.css']
})
export class BestRatedDoctorComponent{
  @Input() doctor;

  constructor() { }

}
