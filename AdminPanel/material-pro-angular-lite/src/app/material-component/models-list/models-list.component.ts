import { Component, OnInit, OnDestroy, ViewChild, Inject } from '@angular/core';
import { MatSort, MatPaginator, MatTableDataSource, MatDialog, MatDialogRef, MAT_DIALOG_DATA, MatSnackBar } from '@angular/material';
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

  constructor( private _firestoreDataService: FirestoreDataService, private route: ActivatedRoute, private router: Router,
    private snackBar: MatSnackBar) { }

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
      this.modelsColumns = ['id', 'modelname', 'variants', 'edit', 'remove'];
      this.modelsDataSource.sort = this.sort;
      this.modelsDataSource.paginator = this.paginator;
      console.log('Models List is ', data);
    });
  }

  editModel(model) {
    localStorage.removeItem('model');
    model.brandId = this.id;
    localStorage.setItem('model', JSON.stringify(model));
    console.log(localStorage.getItem('model'));
    this.router.navigate(['/edit-model']);
  }

  removeModel(model) {
    if (confirm('Are you sure to remove')) {
      this._firestoreDataService.removeModel(this.id, model.id);
      this.snackBar.open('Notification', 'Model removed sucessfully.', {
        duration: 2000,
      });

    }
  }

}
