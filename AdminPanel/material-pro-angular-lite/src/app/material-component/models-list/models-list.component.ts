import { Component, OnInit, OnDestroy, ViewChild, Inject } from '@angular/core';
import {MatSort, MatPaginator, MatTableDataSource, MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';
import { FirestoreDataService } from './../../firestore-data.service';
import { ActivatedRoute, Router } from '@angular/router';

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

  constructor( private _firestoreDataService: FirestoreDataService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {
    this.sub = this.route.params.subscribe( params => {
      this.id = params['id'];
      this.showAllModels(this.id);
    });
  }

  ngOnDestroy() {
    this.sub.unsubscribe();
  }

  goToAddModel() {
    this.router.navigate(['/add-model', this.id ]);
  }

  showAllModels(brandId) {
    this._firestoreDataService.getAllModels(brandId).subscribe(data => {
      this.modelsDataSource = new MatTableDataSource(data);
      this.modelsColumns = ['id', 'modelname', 'variants'];
      this.modelsDataSource.sort = this.sort;
      this.modelsDataSource.paginator = this.paginator;
      console.log('Models List is ', data);
    });
  }

  openDialogToAddModel() {

  }

}
