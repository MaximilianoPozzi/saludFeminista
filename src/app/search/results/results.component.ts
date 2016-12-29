import { Component } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {SearchService} from "../search.service";
import {Subscription} from "rxjs";

@Component({
  selector: 'app-results',
  templateUrl: './results.component.html',
  styleUrls: ['./results.component.css']
})
export class ResultsComponent{

  private id: number;
  private results;
  private routerSubscription : Subscription;

  constructor(private activatedRoute: ActivatedRoute, private searchService: SearchService, private router: Router) {
    this.activatedRoute.params.subscribe(param =>
      this.id = param['id']
    );
    this.routerSubscription = this.router.events.subscribe(val =>
      this.searchService.queryResults(this.id).subscribe(results =>
          this.results = results
      )
    )

  }

}
