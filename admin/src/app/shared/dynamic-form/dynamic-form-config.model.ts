export interface DynamicFormConfigGroup {
  name: string;
  repeated: boolean;
  children: Array<DynamicFormConfig>;
  formType: 'group';
}

export interface DynamicFormConfigField {
  name: string;
  repeated: boolean;
  type: 'string' | 'number' | 'boolean';
  formType: 'field';
}

export type DynamicFormConfig = DynamicFormConfigField | DynamicFormConfigGroup
