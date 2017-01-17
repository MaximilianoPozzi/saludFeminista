import {Component, OnDestroy} from '@angular/core';
import { HomeService } from '../home.service';
import {Router} from "@angular/router";
import {Subscription} from "rxjs";

@Component({
  selector: 'app-latest-opinions',
  templateUrl: './latest-opinions.component.html',
  styleUrls: ['./latest-opinions.component.css']
})
export class LatestOpinionsComponent implements OnDestroy{

  private latestOpinions;
  private routerSubscription: Subscription;

  constructor(private homeService: HomeService, private router: Router) {
    this.routerSubscription = this.router.events.subscribe((val) =>
      this.homeService.getLatestOpinions().subscribe(Profesionales =>
        this.latestOpinions = Profesionales
      )
    )
  }

  ngOnDestroy(){
    this.routerSubscription.unsubscribe();
  }

}
