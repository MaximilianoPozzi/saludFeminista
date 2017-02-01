import { Component, OnInit } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {SearchService} from "../search.service";
import {Subscription} from "rxjs";

@Component({
  selector: 'app-results',
  templateUrl: './results.component.html',
  styleUrls: ['./results.component.css']
})
export class ResultsComponent  {

  private nombre: string;
  private idLocalidad:number;
  private idProvincia: number;
  private idEspecialidad: number;
  private errorMessage: string = '';
  private results;
  private routerSubscription : Subscription;


  constructor(private activatedRoute: ActivatedRoute, private searchService: SearchService, private router: Router) {
    this.activatedRoute.queryParams.subscribe(param =>
      {this.nombre = param['nombre'];
      this.idLocalidad=param['idLocalidad'];
      this.idProvincia=param['idProvincia'];
      this.idEspecialidad=param['idEspecialidad'];
      console.log(this.nombre+' '+this.idLocalidad+' '+ this.idProvincia + ' '+this.idEspecialidad)

      }
    );

    this.routerSubscription = this.router.events.subscribe(val =>
      this.searchService.queryResults(this.nombre, this.idLocalidad, this.idProvincia, this.idEspecialidad).subscribe(
        Profesionales => this.results = Profesionales,
        e => this.errorMessage = e
      )
    )

  }



}
