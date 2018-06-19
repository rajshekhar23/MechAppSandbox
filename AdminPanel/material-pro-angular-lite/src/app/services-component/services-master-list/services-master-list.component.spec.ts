import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ServicesMasterListComponent } from './services-master-list.component';

describe('ServicesMasterListComponent', () => {
  let component: ServicesMasterListComponent;
  let fixture: ComponentFixture<ServicesMasterListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ServicesMasterListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ServicesMasterListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
