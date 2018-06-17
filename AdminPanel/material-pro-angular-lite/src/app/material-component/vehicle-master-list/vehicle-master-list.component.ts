import { Model } from './../../models/models';
import { FirestoreDataService } from './../../firestore-data.service';
import { Vehicle } from './../../models/vehicles';
import { Component, OnInit, OnDestroy, ViewChild } from '@angular/core';
import {MatSort, MatPaginator, MatTableDataSource} from '@angular/material';
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
  constructor( private _firestoreDataService: FirestoreDataService) { }

  ngOnInit() {
    this._firestoreDataService.getVehicleMasterList().subscribe( data => {
      this.brandDataSource = new MatTableDataSource(data);
      this.brandColumns = ['id', 'brand', 'vehicletype', 'action'];
      this.brandDataSource.sort = this.sort;
      this.brandDataSource.paginator = this.paginator;
      console.log('vehicleMaster List is ', this.brandDataSource);
    });
  }

}
