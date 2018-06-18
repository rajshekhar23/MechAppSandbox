import { Router } from '@angular/router';
import { Model } from './../../models/models';
import { FirestoreDataService } from './../../firestore-data.service';
import { Vehicle } from './../../models/vehicles';
import { Component, OnInit, OnDestroy, ViewChild } from '@angular/core';
import { MatSort, MatPaginator, MatTableDataSource, MatSnackBar } from '@angular/material';
import { AngularFireDatabase } from 'angularfire2/database';

@Component({
  selector: 'app-vehicle-master-list',
  templateUrl: './vehicle-master-list.component.html',
  styleUrls: ['./vehicle-master-list.component.css']
})

export class VehicleMasterListComponent implements OnInit {
  brandColumns: any;
  brandDataSource: any;

    @ViewChild(MatSort) sort: MatSort;
    @ViewChild(MatPaginator) paginator: MatPaginator;
  constructor( private _firestoreDataService: FirestoreDataService, private router: Router,
    private snackBar: MatSnackBar) { }

  ngOnInit() {
    this._firestoreDataService.getVehicleMasterList().subscribe( data => {
      this.brandDataSource = new MatTableDataSource(data);
      this.brandColumns = ['id', 'brand', 'vehicletype', 'edit', 'remove', 'showmodel'];
      this.brandDataSource.sort = this.sort;
      this.brandDataSource.paginator = this.paginator;
      console.log('vehicleMaster List is ', this.brandDataSource);
    });
  }

  editBrand(vehicle) {
    localStorage.removeItem('vehicle');
    localStorage.setItem('vehicle', JSON.stringify(vehicle));
    console.log(localStorage.getItem('vehicle'));
    this.router.navigate(['/add-vehicle-brand']);
  }

  removeBrand(brand) {
    if (confirm('Are you sure to remove')) {
      this._firestoreDataService.removeBrand(brand.id);
      this.snackBar.open('Notification', 'Brand removed sucessfully.', {
        duration: 2000,
      });
    }
  }

}
