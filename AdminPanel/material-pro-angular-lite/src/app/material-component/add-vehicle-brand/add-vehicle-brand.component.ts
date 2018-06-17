import { Observable } from 'rxjs';
import { ActivatedRoute, Router } from '@angular/router';
import { FirestoreDataService } from './../../firestore-data.service';
import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';


@Component({
  selector: 'app-add-vehicle-brand',
  templateUrl: './add-vehicle-brand.component.html',
  styleUrls: ['./add-vehicle-brand.component.css']
})
export class AddVehicleBrandComponent implements OnInit {
  brandname = new FormControl('', [Validators.required]);
  brandId: any;
  private sub: any;
  vehicletype = new FormControl('', [Validators.required]);
  selectedVehicleType: any;
  vehicleTypeList = ['2-Wheeler', '4-Wheeler'];

  constructor(private _firestoreDataService: FirestoreDataService, private route: ActivatedRoute,
  private snackBar: MatSnackBar, private router: Router) {
    this.vehicletype.valueChanges.subscribe((value) => {
      this.selectedVehicleType = value;
    });
  }

  ngOnInit() {
    this.sub = this.route.params.subscribe( params => {
      this.brandId = params['brandId'];
    });
  }

  getErrorMessage() {
    if (this.brandname.hasError('required') || this.vehicletype.hasError('required')) {
      return 'You must enter a value';
    }
  }

  addVehicleBrand(): void {
    this._firestoreDataService.addVehicleBrand(this.brandname.value, this.selectedVehicleType);
    this.snackBar.open('Notification', 'Model Added Successfully.', {
      duration: 2000,
    });
    this.router.navigate(['/vehicle-master-list']);
  }
}
