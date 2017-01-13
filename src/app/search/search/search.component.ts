import {Component, OnDestroy, OnChanges, SimpleChanges} from '@angular/core';
import {FormGroup, FormBuilder, Validators} from "@angular/forms";
import {Router} from "@angular/router";
import {Subscription} from "rxjs";
import {SearchService} from "../search.service";

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnDestroy{

  private cities;
  private citiesSubscription: Subscription;
  private provinces;
  private validDoctorName: boolean = true;
  private validForm: boolean = false;
  private validProvince: boolean = true;

  private routerSubscription: Subscription;
  private searchForm: FormGroup;

  constructor(private formBuilder: FormBuilder, private router: Router, private searchService: SearchService) {
    this.routerSubscription = this.router.events.subscribe(val =>
      this.searchService.getProvinces().subscribe(provinces =>
        this.provinces = provinces
      )
    );

    this.searchForm = formBuilder.group({
      'doctorName': ['', [Validators.required]],
      'provinces': ['', [Validators.required]],
      'cities':['']
    });

    this.searchForm.controls['provinces']
      .valueChanges
      .subscribe(form => {
        this.setCities(form.id);
      })
  }


  ngOnDestroy() {
    if(this.citiesSubscription){
      this.citiesSubscription.unsubscribe();
    }
    this.routerSubscription.unsubscribe();
  }


  onSubmit(){
    if(this.searchForm.valid){
      this.router.navigate(['busqueda', 'resultados'], {queryParams: {
        nombre: this.searchForm.controls['doctorName'].value,
        idProvincia: this.searchForm.controls['provinces'].value.id,
        idLocalidad: this.searchForm.controls['cities'].value.id
      }});
    }

    this.validDoctorName = this.searchForm.controls['doctorName'].valid;
    this.validForm = this.searchForm.valid;
    this.validProvince = this.searchForm.controls['provinces'].valid;
  }

  setCities(id:number){
    this.citiesSubscription = this.searchService.getCitiesByProvince(id).subscribe(cities =>
      this.cities = cities
    )
  }

}
