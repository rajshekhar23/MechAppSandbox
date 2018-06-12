import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VehicleMasterListComponent } from './vehicle-master-list.component';

describe('VehicleMasterListComponent', () => {
  let component: VehicleMasterListComponent;
  let fixture: ComponentFixture<VehicleMasterListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VehicleMasterListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VehicleMasterListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
