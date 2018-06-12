import { Component, OnInit, OnDestroy, ViewChild } from '@angular/core';
import {MatSort, MatPaginator, MatTableDataSource} from '@angular/material';
import { FirestoreDataService } from './../../firestore-data.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-models-list',
  templateUrl: './models-list.component.html',
  styleUrls: ['./models-list.component.css']
})
export class ModelsListComponent implements OnInit, OnDestroy {
  modelsColumns: any;
  modelsDataSource: any;
  id: number;
  private sub: any;
  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  constructor( private _firestoreDataService: FirestoreDataService, private route: ActivatedRoute) { }

  ngOnInit() {
    this.sub = this.route.params.subscribe( params => {
      this.id = params['id'];
      this.showAllModels(this.id);
    });
  }

  ngOnDestroy() {
    this.sub.unsubscribe();
  }

  showAllModels(brandId) {
    this._firestoreDataService.getModelDetailByBrand(brandId).subscribe(data => {
      this.modelsDataSource = new MatTableDataSource(data);
      this.modelsColumns = ['id', 'modelname', 'variants'];
      this.modelsDataSource.sort = this.sort;
      this.modelsDataSource.paginator = this.paginator;
      console.log('Models List is ', this.modelsDataSource);
    });
  }

}
