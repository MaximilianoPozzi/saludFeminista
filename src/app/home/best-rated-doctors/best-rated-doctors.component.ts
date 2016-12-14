import {Component, OnInit, OnDestroy} from '@angular/core';
import {Router} from "@angular/router";
import {Subscription} from "rxjs";
import {HomeService} from "../home.service";

@Component({
  selector: 'app-best-rated-doctors',
  templateUrl: './best-rated-doctors.component.html',
  styleUrls: ['./best-rated-doctors.component.css']
})
export class BestRatedDoctorsComponent implements OnDestroy{

  private bestDoctors;
  private routerSubscription: Subscription;

  constructor( private homeService: HomeService, private router: Router ) {
    this.routerSubscription = this.router.events.subscribe((val) =>
      this.homeService.getBestRatedDoctors().subscribe(bestDoctors =>
        this.bestDoctors = bestDoctors
      )
    )
  }

  ngOnDestroy() {
    this.routerSubscription.unsubscribe();
  }

}
