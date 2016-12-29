import {Component, OnDestroy} from '@angular/core';
import {Router} from "@angular/router";
import {DoctorService} from "../doctor.service";
import {Subscription} from "rxjs";

@Component({
  selector: 'app-doctor',
  templateUrl: './doctor.component.html',
  styleUrls: ['./doctor.component.css']
})
export class DoctorComponent implements OnDestroy{

  private doctor;
  private routerSubscription: Subscription;

  constructor(private doctorService: DoctorService, private router: Router) {
    this.routerSubscription = this.router.events.subscribe(val =>
      this.doctorService.getDoctor().subscribe(doctor => {
          this.doctor = doctor;
          console.log(doctor);
        }
      )
    )
  }

  ngOnDestroy(){
    this.routerSubscription.unsubscribe();
  }
}
