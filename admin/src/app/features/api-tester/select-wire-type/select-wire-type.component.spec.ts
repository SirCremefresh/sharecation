import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SelectWireTypeComponent } from './select-wire-type.component';

describe('SelectWireTypeComponent', () => {
  let component: SelectWireTypeComponent;
  let fixture: ComponentFixture<SelectWireTypeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SelectWireTypeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SelectWireTypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
