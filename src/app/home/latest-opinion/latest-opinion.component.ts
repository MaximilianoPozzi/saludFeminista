import {Component, Input} from '@angular/core';

@Component({
  selector: 'app-latest-opinion',
  templateUrl: './latest-opinion.component.html',
  styleUrls: ['./latest-opinion.component.css']
})
export class LatestOpinionComponent{
  @Input() opinion;

  constructor() { }

}
