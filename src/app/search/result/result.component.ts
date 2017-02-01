import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {Router} from "@angular/router";
import {Subscription} from "rxjs";
import {SearchService} from "../search.service";

@Component({
  selector: 'app-result',
  templateUrl: './result.component.html',
  styleUrls: ['./result.component.css']
})
export class ResultComponent  implements OnInit, OnDestroy{
  @Input() doctor;
  private valoracion;
  private valoracionSubscription: Subscription;
  private errorMessage: string = '';

  constructor(private router: Router, private searchService:SearchService)
  {

  }

ngOnInit()
{
  this.valoracionSubscription=this.searchService.getValoracionProfesional(this.doctor.id).subscribe(es =>
      this.valoracion=es,
    e => this.errorMessage = e)


}

ngOnDestroy()
{
  if(this.valoracionSubscription)
  {
    this.valoracionSubscription.unsubscribe();
  }



}

  onClick(){
    this.router.navigate(['doctor', this.doctor.id]);
  }

  goToQualify(id){
    this.router.navigate(['doctor', 'calificar', id]);
  }


}
