import {Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import { AngularFirestore } from 'angularfire2/firestore';
import { FirestoreDataService } from '../../firestore-data.service';
import { Observable } from 'rxjs/Observable';
import { Vehicle } from '../../models/vehicles';

@Component({
  selector: 'app-table-list',
  templateUrl: './table-list.component.html',
  styleUrls: ['./table-list.component.css']
})

export class TableListComponent implements OnInit {
  displayedColumns: any;
  dataSource: any;
  vehicles: Vehicle[];

  @ViewChild(MatSort) sort: MatSort;
  constructor(private _firestoreDataService: FirestoreDataService) {
  }
  ngOnInit() {
    this._firestoreDataService.getUsersList().subscribe( data => {
      this.vehicles = data;
      console.log(this.vehicles);
      this.displayedColumns = Object.keys(this.vehicles[0]);
      this.dataSource = new MatTableDataSource(this.vehicles);
      this.dataSource.sort = this.sort;
    });
  }
}

