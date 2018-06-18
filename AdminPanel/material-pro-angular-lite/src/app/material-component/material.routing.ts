import { AddVehicleBrandComponent } from './add-vehicle-brand/add-vehicle-brand.component';
import { AddModelComponent } from './add-model/add-model.component';
import { Routes } from '@angular/router';
import { VehicleMasterListComponent } from './vehicle-master-list/vehicle-master-list.component';
import { ModelsListComponent } from './models-list/models-list.component';

export const MaterialRoutes: Routes = [
    {
      path: 'add-model/:brandId',
      component: AddModelComponent
    }, {
      path: 'edit-model',
      component: AddModelComponent
    }, {
      path: 'add-vehicle-brand',
      component: AddVehicleBrandComponent
    }, {
      path: 'models-list/:id',
      component: ModelsListComponent
    }, {
      path: 'vehicle-master-list',
      component: VehicleMasterListComponent
    }
];
