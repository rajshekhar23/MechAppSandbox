import { AngularFireDatabaseModule } from 'angularfire2/database';
import 'hammerjs';
import { DataTablesModule } from 'angular-datatables';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { DemoMaterialModule} from '../demo-material-module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FlexLayoutModule } from '@angular/flex-layout';
import { ServicesRoutes } from './services.routing';
import { ServicesMasterListComponent } from './services-master-list/services-master-list.component';
import { AddServicesComponent } from './add-services/add-services.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(ServicesRoutes),
    DemoMaterialModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    FlexLayoutModule,
    DataTablesModule,
    AngularFireDatabaseModule
  ],
  providers: [

  ],
  entryComponents: [
  ],
  declarations: [
    ServicesMasterListComponent,
    AddServicesComponent
  ]
})
export class ServicesModule { }
