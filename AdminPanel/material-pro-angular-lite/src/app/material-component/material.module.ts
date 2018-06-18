import 'hammerjs';
import { DataTablesModule } from 'angular-datatables';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { DemoMaterialModule} from '../demo-material-module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FlexLayoutModule } from '@angular/flex-layout';
import { MaterialRoutes } from './material.routing';
import { VehicleMasterListComponent } from './vehicle-master-list/vehicle-master-list.component';
import { ModelsListComponent } from './models-list/models-list.component';
import { AngularFireDatabaseModule } from 'angularfire2/database';
import { AddModelComponent } from './add-model/add-model.component';
import { AddVehicleBrandComponent } from './add-vehicle-brand/add-vehicle-brand.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(MaterialRoutes),
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
    VehicleMasterListComponent,
    ModelsListComponent,
    AddModelComponent,
    AddVehicleBrandComponent
  ]
})

export class MaterialComponentsModule {}
