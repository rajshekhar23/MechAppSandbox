import { Injectable, OnInit } from '@angular/core';
import { AngularFirestore, AngularFirestoreCollection, AngularFirestoreDocument } from 'angularfire2/firestore';
import { Observable } from 'rxjs/Observable';
import { Vehicle } from './models/vehicles';
import 'rxjs/add/operator/map';

@Injectable({
  providedIn: 'root'
})
export class FirestoreDataService implements OnInit {
  vehicles: Observable<Vehicle[]>;
  constructor(private afs: AngularFirestore) {
  }

  ngOnInit() {
  }

  getUsersList(): Observable<any> {
    this.vehicles = this.afs.collection<Vehicle>('vehiclemaster').snapshotChanges().map( actions => {
      return actions.map( action => {
        const data = action.payload.doc.data() as Vehicle;
        const id  = action.payload.doc.id;
        return data;
      });
    });
    return this.vehicles;
  }
}
