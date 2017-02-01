import { Component, OnDestroy } from '@angular/core';
import { HomeService } from '../home.service';
import {Router} from "@angular/router";
import {Subscription} from "rxjs";

@Component({
  selector: 'app-latest-profesionals',
  templateUrl: './latest-profesionals.component.html',
  styleUrls: ['./latest-profesionals.component.css']
})
export class LatestProfesionalsComponent implements OnDestroy{
  private latestProfesionals;
  private routerSubscription: Subscription;

  constructor(private homeService: HomeService, private router: Router) {

    this.routerSubscription = this.router.events.subscribe((val) =>
      this.homeService.getLatestDoctors().subscribe(Profesionales =>{
        this.latestProfesionals = Profesionales;
      }))

  }

  ngOnDestroy() {
    if(this.routerSubscription)
    {
      this.routerSubscription.unsubscribe()
    }
  }

}
