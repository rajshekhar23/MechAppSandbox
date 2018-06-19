import { Observable } from 'rxjs';
import { ActivatedRoute, Router } from '@angular/router';
import { FirestoreDataService } from './../../firestore-data.service';
import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-add-model',
  templateUrl: './add-model.component.html',
  styleUrls: ['./add-model.component.css']
})

export class AddModelComponent implements OnInit {
  modelname = new FormControl('', [Validators.required]);
  variantname = new FormControl('', [Validators.required]);
  selectedFuelType: string;
  brandId: any;
  sub: any;
  fuelTypesList = ['Petrol', 'Diesel', 'CNG', 'Other'];
  isUpdateActive: any;
  model: any;
  constructor(private _firestoreDataService: FirestoreDataService, private route: ActivatedRoute,
  private snackBar: MatSnackBar, private router: Router) {
  }

  ngOnInit() {
    this.selectedFuelType = 'Other';
    if (localStorage.getItem('model')) {
      this.isUpdateActive = true;
      this.model = JSON.parse(localStorage.getItem('model'));
      this.modelname.setValue(this.model.modelname);
      this.variantname.setValue(this.model.variantname);
      this.selectedFuelType = this.model.fueltype;
    } else {
      this.isUpdateActive = false;
    }
    this.sub = this.route.params.subscribe( params => {
      this.brandId = params['brandId'];
    });
  }

  getErrorMessage() {
    if (this.modelname.hasError('required') || this.modelname.hasError('required')) {
      return 'You must enter a value';
    }
  }

  addModel(): void {
    this._firestoreDataService.addModelToActiveBrand(this.brandId, this.modelname.value, this.variantname.value, this.selectedFuelType);
    this.snackBar.open('Notification', 'Model Added Successfully.', {
      duration: 2000,
    });
    this.router.navigate(['/models-list', this.brandId]);
  }

  updateModel(): void {
    this._firestoreDataService.updateModel(this.model.brandId, this.model.id, this.modelname.value, this.variantname.value,
      this.selectedFuelType);
    this.snackBar.open('Notification', 'Model updated successfully.', {
      duration: 2000,
    });
    localStorage.clear();
    this.router.navigate(['/models-list', this.model.brandId]);
  }

}
