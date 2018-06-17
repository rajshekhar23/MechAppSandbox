import { AddVehicleBrandComponent } from './add-vehicle-brand/add-vehicle-brand.component';
import { AddModelComponent } from './add-model/add-model.component';
import { Routes } from '@angular/router';

import { ButtonsComponent } from './buttons/buttons.component';
import { GridComponent } from './grid/grid.component';
import { ListsComponent } from './lists/lists.component';
import { MenuComponent } from './menu/menu.component';
import { TabsComponent } from './tabs/tabs.component';
import { StepperComponent } from './stepper/stepper.component';
import { ExpansionComponent } from './expansion/expansion.component';
import { ChipsComponent } from './chips/chips.component';
import { ToolbarComponent } from './toolbar/toolbar.component';
import { ProgressSnipperComponent } from './progress-snipper/progress-snipper.component';
import { ProgressComponent } from './progress/progress.component';
import { DialogComponent } from './dialog/dialog.component';
import { TooltipComponent } from './tooltip/tooltip.component';
import { SnackbarComponent } from './snackbar/snackbar.component';
import { SliderComponent } from './slider/slider.component';
import { SlideToggleComponent } from './slide-toggle/slide-toggle.component';
import { VehicleMasterListComponent } from './vehicle-master-list/vehicle-master-list.component';
import { ModelsListComponent } from './models-list/models-list.component';

export const MaterialRoutes: Routes = [
    {
      path: 'add-model/:brandId',
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
