import { Component } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {Router} from "@angular/router";
import {DoctorService} from "../doctor.service";

@Component({
  selector: 'app-new-doctor',
  templateUrl: './new-doctor.component.html',
  styleUrls: ['./new-doctor.component.css']
})
export class NewDoctorComponent{

  private errorMessage;
  private newDoctorForm: FormGroup;

  private emptyName: boolean = false;
  private emptyProvince: boolean = false;
  private emptyCity: boolean = false;
  private emptySpeciality: boolean = false;
  private emptyRating: boolean = false;
  private emptyCommentary: boolean = false;
  private emptyUserEMail: boolean = false;
  private validUserEMail: boolean = false;


  constructor(private doctorService: DoctorService, private formBuilder: FormBuilder, private router: Router) {
    this.newDoctorForm = formBuilder.group({
      'name': ['', [Validators.required]],
      'province': ['', [Validators.required]],
      'city': ['', [Validators.required]],
      'speciality': ['', [Validators.required]],
      'procedure': [''],
      'rating': ['',[Validators.required]],
      'commentary': ['', [Validators.required]],
      'userEMail': ['', [Validators.required, Validators.pattern("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")]]
    })
  }


  onSubmit(){
    if(this.newDoctorForm.valid){
      this.doctorService.sendNewDoctor({
        name: this.newDoctorForm.controls['name'].value,
        province: this.newDoctorForm.controls['province'].value,
        city: this.newDoctorForm.controls['city'].value,
        speciality: this.newDoctorForm.controls['speciality'].value,
        procedure: this.newDoctorForm.controls['procedure'].value,
        rating: this.newDoctorForm.controls['rating'].value,
        commentary: this.newDoctorForm.controls['commentary'].value,
        userEMail: this.newDoctorForm.controls['userEMail'].value
      }).subscribe(
        ok => this.router.navigate(['doctor', 'enviado']),
        error => this.errorMessage = error
      );
    } else {
        this.emptyName = !this.newDoctorForm.controls['name'].valid;
        this.emptyProvince = !this.newDoctorForm.controls['province'].valid;
        this.emptyCity = !this.newDoctorForm.controls['city'].valid;
        this.emptySpeciality = !this.newDoctorForm.controls['speciality'].valid;
        this.emptyRating = !this.newDoctorForm.controls['rating'].valid;
        this.emptyCommentary = !this.newDoctorForm.controls['commentary'].valid;
        this.emptyUserEMail = this.newDoctorForm.controls['userEMail'].value === "";
        this.validUserEMail = !(this.newDoctorForm.controls['userEMail'].value === "") && !this.newDoctorForm.controls['userEMail'].valid;
    }

  }


}
