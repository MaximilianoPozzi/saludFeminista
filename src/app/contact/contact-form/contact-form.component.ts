import { Component } from '@angular/core';
import {FormGroup, FormBuilder, Validators} from "@angular/forms";
import {Router} from "@angular/router";
import {ContactService} from "../contact.service";

@Component({
  selector: 'app-contact-form',
  templateUrl: './contact-form.component.html',
  styleUrls: ['./contact-form.component.css']
})
export class ContactFormComponent{
  contactForm: FormGroup;
  private emptyEMail: boolean = false;
  private emptyName: boolean = false;
  private errorMessage;
  private invalidEMail : boolean = false;
  private longEnoughMessage: boolean = false;


  constructor(private contactService: ContactService, private formBuilder: FormBuilder, private router: Router) {
    this.contactForm = formBuilder.group({
      'name': ['', Validators.required],
      'email': ['', [Validators.required, Validators.pattern("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")]],
      'message': ['', [Validators.required, Validators.minLength(20)]]
    });
  }

  onSubmit(){
    console.log(this.contactForm);
    if(this.contactForm.valid){
      let contactMsg= {
        name: this.contactForm.controls['name'].value,
        email: this.contactForm.controls['email'].value,
        message: this.contactForm.controls['message'].value
      };
      this.contactService.sendContactForm(contactMsg).subscribe(
        ok => this.router.navigate(['contacto', 'sent']),
        error => {this.errorMessage = error;console.log(error);}
      )

    } else {
      if(!this.contactForm.controls['name'].value){
        this.emptyName = true;
      }
      if(!this.contactForm.controls['email'].value){
        this.emptyEMail = true;
      }
      if(this.contactForm.controls['email'].value && !this.contactForm.controls['email'].valid){
        this.invalidEMail = true;
      }
      if(!this.contactForm.controls['message'].valid){
        this.longEnoughMessage = true;
      }
    }
  }


}
