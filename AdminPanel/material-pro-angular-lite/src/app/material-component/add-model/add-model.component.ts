import { ActivatedRoute } from '@angular/router';
import { FirestoreDataService } from './../../firestore-data.service';
import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
@Component({
  selector: 'app-add-model',
  templateUrl: './add-model.component.html',
  styleUrls: ['./add-model.component.css']
})
export class AddModelComponent implements OnInit {
  modelname = new FormControl('', [Validators.required]);
  brandId: any;
  private sub: any;

  constructor(private _firestoreDataService: FirestoreDataService, private route: ActivatedRoute) { }

  ngOnInit() {
    this.sub = this.route.params.subscribe( params => {
      this.brandId = params['brandId'];
    });
  }

  getErrorMessage() {
    return this.modelname.hasError('required') ? 'You must enter a value' : '';
  }

  addModel(): void {
    const result = this._firestoreDataService.addModelToActiveBrand(this.brandId, this.modelname.value);
    if (result === 'success') {
    } else {

    }
  }
}
