import {  Component} from '@angular/core';
import { FirestoreDataService } from './firestore-data.service';
import { SlimLoadingBarModule, SlimLoadingBarService } from 'ng2-slim-loading-bar';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],

})

export class AppComponent {
  constructor(private _loadingBar: SlimLoadingBarService) {

  }
}
