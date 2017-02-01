import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-latest-profesional',
  templateUrl: 'latest-profesional.component.html',
  styleUrls: ['latest-profesional.component.css']
})
export class LatestProfesionalComponent {
  @Input() profesional;

  constructor() { }


}
