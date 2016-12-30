import {Component, OnDestroy} from '@angular/core';
import {FormGroup, FormBuilder, Validators} from "@angular/forms";
import {DoctorService} from "../doctor.service";
import {Router, ActivatedRoute} from "@angular/router";
import {Subscription} from "rxjs";

@Component({
  selector: 'app-qualify-doctor',
  templateUrl: './qualify-doctor.component.html',
  styleUrls: ['./qualify-doctor.component.css']
})
export class QualifyDoctorComponent implements OnDestroy{

  private currentUrl;
  private doctorId;
  private qualifyDoctorForm: FormGroup;
  private paramSubscription: Subscription;

  constructor(private activatedRoute: ActivatedRoute, private doctorService: DoctorService, private formBuilder: FormBuilder, private router: Router) {

    this.currentUrl = this.router.url;

    this.paramSubscription = this.activatedRoute.params.subscribe(param =>
      this.doctorId = param['id']
    );

    this.qualifyDoctorForm = this.formBuilder.group({
      'rating': ['', Validators.required],
      'commentary': ['']
    })
  }

  ngOnDestroy(){
    this.paramSubscription.unsubscribe();
  }

  onSubmit(){
    if(this.qualifyDoctorForm.valid) {
      let newRating = {
        id: this.doctorId,
        rating: this.qualifyDoctorForm.controls['rating'].value,
        commentary: this.qualifyDoctorForm.controls['commentary'].value
      };
      let arrayUrl = this.currentUrl.split('/').slice(1);
      this.doctorService.sendRating(newRating).subscribe(
        ok => {
          arrayUrl.push('enviado');
          this.router.navigate(arrayUrl);
        }
      )
    }
  }

}
