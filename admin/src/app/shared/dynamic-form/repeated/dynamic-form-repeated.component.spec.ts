import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DynamicFormRepeatedComponent } from './dynamic-form-repeated.component';

describe('DynamicFormRepeatedComponent', () => {
  let component: DynamicFormRepeatedComponent;
  let fixture: ComponentFixture<DynamicFormRepeatedComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DynamicFormRepeatedComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DynamicFormRepeatedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
