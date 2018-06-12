import { Injectable, OnInit } from '@angular/core';
import {
  AngularFirestore,
  AngularFirestoreCollection,
  AngularFirestoreDocument
} from 'angularfire2/firestore';
import { AngularFireDatabase } from 'angularfire2/database';
import { Observable } from 'rxjs/Observable';
import { Vehicle } from './models/vehicles';
import { Model } from './models/models';
import 'rxjs/add/operator/map';

@Injectable({
  providedIn: 'root'
})
export class FirestoreDataService implements OnInit {
  vehicles: Observable<Vehicle[]>;
  models: Observable<Model[]>;
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
          return { id, ...data };
        });
      });
    return this.models;
  }
}
