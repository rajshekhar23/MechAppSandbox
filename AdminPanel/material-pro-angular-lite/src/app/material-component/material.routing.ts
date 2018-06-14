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
import { TableListComponent } from './table-list/table-list.component';
import { VehicleMasterListComponent } from './vehicle-master-list/vehicle-master-list.component';
import { ModelsListComponent } from './models-list/models-list.component';

export const MaterialRoutes: Routes = [
    {
      path: 'button',
      component: ButtonsComponent
    }, {
      path: 'grid',
      component: GridComponent
    }, {
      path: 'table-list',
      component: TableListComponent
    }, {
      path: 'add-model/:brandId',
      component: AddModelComponent
    }, {
      path: 'models-list/:id',
      component: ModelsListComponent
    }, {
      path: 'vehicle-master-list',
      component: VehicleMasterListComponent
    }, {
      path: 'lists',
      component: ListsComponent
    }, {
      path: 'menu',
      component: MenuComponent
    }, {
      path: 'tabs',
      component: TabsComponent
    }, {
      path: 'stepper',
      component: StepperComponent
    }, {
      path: 'expansion',
      component: ExpansionComponent
    }, {
      path: 'chips',
      component: ChipsComponent
    }, {
      path: 'toolbar',
      component: ToolbarComponent
    }, {
      path: 'progress-snipper',
      component: ProgressSnipperComponent
    }, {
      path: 'progress',
      component: ProgressComponent
    }, {
      path: 'dialog',
      component: DialogComponent
    }, {
      path: 'tooltip',
      component: TooltipComponent
    }, {
      path: 'snackbar',
      component: SnackbarComponent
    }, {
      path: 'slider',
      component: SliderComponent
    }, {
      path: 'slide-toggle',
      component: SlideToggleComponent
    }
];
