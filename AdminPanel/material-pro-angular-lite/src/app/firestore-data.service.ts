import { Injectable, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreCollection, AngularFirestoreDocument } from 'angularfire2/firestore';
import { AngularFireDatabase } from 'angularfire2/database';
import { Observable } from 'rxjs/Observable';
import { Vehicle } from './models/vehicles';
import { Variant} from './models/variants';
import { Model } from './models/models';
import 'rxjs/add/operator/map';

@Injectable({
  providedIn: 'root'
})

export class FirestoreDataService implements OnInit {
  vehicles: Observable<Vehicle[]>;
  models: Observable<Model[]>;
  model: Model;
  vehicle: Vehicle;
  constructor(private afs: AngularFirestore, private db: AngularFireDatabase) {}

  ngOnInit() {}

  getVehicleMasterList(): Observable<any> {
    this.vehicles = this.afs
      .collection<Vehicle>('vehiclemaster')
      .snapshotChanges()
      .map(actions => {
        return actions.map(action => {
          const data = action.payload.doc.data() as Vehicle;
          const id = action.payload.doc.id;
          return { id, ...data };
        });
      });
    return this.vehicles;
  }

  getModelDetailByBrand(brandId): Observable<any> {
    this.models = this.afs
      .collection<Vehicle>('vehiclemaster')
      .doc(brandId)
      .collection<Model>('model')
      .snapshotChanges()
      .map(actions => {
        return actions.map(action => {
          const data = action.payload.doc.data() as Model;
          const id = action.payload.doc.id;
          data['variants'] = [];
          this.afs.collection<Vehicle>('vehiclemaster')
          .doc(brandId).collection<Model>('model')
          .doc(id).collection<Variant>('variants').ref.get()
          .then( res => {
            console.log(res);
            if (res.docChanges().length !== 0) {
              res.docChanges().map( document => {
                const variantObject = {};
                if ((document.doc.data() as Variant).variantname) {
                  variantObject['variantName'] = (document.doc.data() as Variant).variantname;
                  variantObject['variantId'] = document.doc.id;
                  data['variants'].push(variantObject);
                } else {
                  data['variants'] = [];
                }
              });
            }
          });
          console.log(data);
          return { id, ...data , ...data['variants']};
        });
      });
    return this.models;
  }

  addModelToActiveBrand(brandId, modelValue): string {
    let result: any;
    this.model = modelValue;
    this.afs.collection('vehiclemaster')
    .doc(brandId).collection('model')
    .add({modelname: this.model})
    .then( docRef => {
      result = 'succes';
    }).catch( error => {
      result = error;
    });
    return result;
  }

}
