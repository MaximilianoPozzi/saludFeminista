import {Component, OnDestroy, OnChanges, SimpleChanges, OnInit} from '@angular/core';
import {FormGroup, FormBuilder, Validators} from "@angular/forms";
import {Router} from "@angular/router";
import {Subscription} from "rxjs";
import {SearchService} from "../search.service";

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnDestroy,OnInit{

  private cities;
  private citiesSubscription: Subscription;
  private provinces;
  private especialidades;
  private especialidadesSubscription: Subscription;
  private validDoctorName: boolean = true;
  private validProvince: boolean = true;
  private validForm: boolean = false;
  private routerSubscription: Subscription;
  private searchForm: FormGroup;
  private errorMessage: string = '';
  private nombreQuery='all';
  private idEspecialidadQuery='all';
  private idProvinciaQuery='all';
  private idLocalidadQuery='all';

  constructor(private formBuilder: FormBuilder, private router: Router, private searchService: SearchService) {
    this.routerSubscription = this.router.events.subscribe(
      val =>
      this.searchService.getProvinces().subscribe(p =>
        this.provinces = p,
        e => this.errorMessage = e
      )

    );

    this.searchForm = formBuilder.group({
      'doctorName': [''],
      'especialidades':[''],
      'provinces': [''],
      'cities':['']
    });

    this.searchForm.controls['provinces']
      .valueChanges
      .subscribe(form => {
        this.setCities(form.id);
      })
  }

  ngOnInit() {
    this.especialidadesSubscription=this.searchService.getEspecialidades().subscribe(es =>
        this.especialidades=es,
      e => this.errorMessage = e)

  };

  ngOnDestroy() {
    if(this.citiesSubscription){
      this.citiesSubscription.unsubscribe();
    }
    this.routerSubscription.unsubscribe();

    if(this.especialidadesSubscription)
    {this.especialidadesSubscription.unsubscribe();}

  }


  onSubmit(){
    if(this.searchForm.valid){

      this.setearVariablesParaQuery();

      this.router.navigate(['busqueda', 'resultados'], {queryParams: {
        nombre: this.nombreQuery,
        idProvincia: this.idProvinciaQuery,
        idLocalidad: this.idLocalidadQuery,
        idEspecialidad: this.idEspecialidadQuery
      }});
    }

    this.validDoctorName = this.searchForm.controls['doctorName'].valid;
    this.validForm = this.searchForm.valid;
    this.validProvince = this.searchForm.controls['provinces'].valid;
  }

  setearVariablesParaQuery()
  {
    if(this.searchForm.controls['doctorName'].value)
    {
      this.nombreQuery=this.searchForm.controls['doctorName'].value;
    }

    if(this.searchForm.controls['provinces'].value)
    {
      this.idProvinciaQuery=this.searchForm.controls['provinces'].value.id;
    }

    if(this.searchForm.controls['cities'].value)
    {
      this.idLocalidadQuery=this.searchForm.controls['cities'].value.id;
    }

    if(this.searchForm.controls['especialidades'].value)
    {
      this.idEspecialidadQuery=this.searchForm.controls['especialidades'].value.id;
    }

  }

  setCities(id:number){
    this.citiesSubscription = this.searchService.getCitiesByProvince(id).subscribe(Localidades =>
      this.cities = Localidades,
      e => this.errorMessage = e
    )
  }

}
