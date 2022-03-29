///
//  Generated code. Do not modify.
//  source: authentication/v1/authentication.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authenticatedDataDescriptor instead')
const AuthenticatedData$json = const {
  '1': 'AuthenticatedData',
  '2': const [
    const {'1': 'sub', '3': 1, '4': 1, '5': 9, '10': 'sub'},
    const {'1': 'exp', '3': 2, '4': 1, '5': 5, '10': 'exp'},
  ],
};

/// Descriptor for `AuthenticatedData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticatedDataDescriptor = $convert.base64Decode('ChFBdXRoZW50aWNhdGVkRGF0YRIQCgNzdWIYASABKAlSA3N1YhIQCgNleHAYAiABKAVSA2V4cA==');
@$core.Deprecated('Use authenticatedDescriptor instead')
const Authenticated$json = const {
  '1': 'Authenticated',
  '2': const [
    const {'1': 'jwt_string', '3': 1, '4': 1, '5': 9, '10': 'jwtString'},
    const {'1': 'data', '3': 2, '4': 1, '5': 11, '6': '.authentication.v1.AuthenticatedData', '10': 'data'},
  ],
};

/// Descriptor for `Authenticated`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticatedDescriptor = $convert.base64Decode('Cg1BdXRoZW50aWNhdGVkEh0KCmp3dF9zdHJpbmcYASABKAlSCWp3dFN0cmluZxI4CgRkYXRhGAIgASgLMiQuYXV0aGVudGljYXRpb24udjEuQXV0aGVudGljYXRlZERhdGFSBGRhdGE=');
@$core.Deprecated('Use createAuthenticationWithFirebaseRequestDescriptor instead')
const CreateAuthenticationWithFirebaseRequest$json = const {
  '1': 'CreateAuthenticationWithFirebaseRequest',
  '2': const [
    const {'1': 'firebase_jwt_string', '3': 1, '4': 1, '5': 9, '10': 'firebaseJwtString'},
  ],
};

/// Descriptor for `CreateAuthenticationWithFirebaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAuthenticationWithFirebaseRequestDescriptor = $convert.base64Decode('CidDcmVhdGVBdXRoZW50aWNhdGlvbldpdGhGaXJlYmFzZVJlcXVlc3QSLgoTZmlyZWJhc2Vfand0X3N0cmluZxgBIAEoCVIRZmlyZWJhc2VKd3RTdHJpbmc=');
@$core.Deprecated('Use createAuthenticationWithFirebaseResponseDescriptor instead')
const CreateAuthenticationWithFirebaseResponse$json = const {
  '1': 'CreateAuthenticationWithFirebaseResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.Authenticated', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `CreateAuthenticationWithFirebaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAuthenticationWithFirebaseResponseDescriptor = $convert.base64Decode('CihDcmVhdGVBdXRoZW50aWNhdGlvbldpdGhGaXJlYmFzZVJlc3BvbnNlEjIKAm9rGAEgASgLMiAuYXV0aGVudGljYXRpb24udjEuQXV0aGVudGljYXRlZEgAUgJvaxItCgVlcnJvchgCIAEoCzIVLmVycm9ycy52MS5CYXNpY0Vycm9ySABSBWVycm9yQgoKCHJlc3BvbnNl');
@$core.Deprecated('Use updateRightOfUserRequestDescriptor instead')
const UpdateRightOfUserRequest$json = const {
  '1': 'UpdateRightOfUserRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'right', '3': 2, '4': 1, '5': 9, '10': 'right'},
    const {'1': 'mutation_type', '3': 3, '4': 1, '5': 14, '6': '.authentication.v1.UpdateRightOfUserRequest.MutationType', '10': 'mutationType'},
  ],
  '4': const [UpdateRightOfUserRequest_MutationType$json],
};

@$core.Deprecated('Use updateRightOfUserRequestDescriptor instead')
const UpdateRightOfUserRequest_MutationType$json = const {
  '1': 'MutationType',
  '2': const [
    const {'1': 'MUTATION_TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'MUTATION_TYPE_ADD', '2': 1},
    const {'1': 'MUTATION_TYPE_DELETE', '2': 2},
  ],
};

/// Descriptor for `UpdateRightOfUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRightOfUserRequestDescriptor = $convert.base64Decode('ChhVcGRhdGVSaWdodE9mVXNlclJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhQKBXJpZ2h0GAIgASgJUgVyaWdodBJdCg1tdXRhdGlvbl90eXBlGAMgASgOMjguYXV0aGVudGljYXRpb24udjEuVXBkYXRlUmlnaHRPZlVzZXJSZXF1ZXN0Lk11dGF0aW9uVHlwZVIMbXV0YXRpb25UeXBlIl4KDE11dGF0aW9uVHlwZRIdChlNVVRBVElPTl9UWVBFX1VOU1BFQ0lGSUVEEAASFQoRTVVUQVRJT05fVFlQRV9BREQQARIYChRNVVRBVElPTl9UWVBFX0RFTEVURRAC');
@$core.Deprecated('Use updateRightOfUserResponseDescriptor instead')
const UpdateRightOfUserResponse$json = const {
  '1': 'UpdateRightOfUserResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `UpdateRightOfUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRightOfUserResponseDescriptor = $convert.base64Decode('ChlVcGRhdGVSaWdodE9mVXNlclJlc3BvbnNlEhAKAm9rGAEgASgJSABSAm9rEi0KBWVycm9yGAIgASgLMhUuZXJyb3JzLnYxLkJhc2ljRXJyb3JIAFIFZXJyb3JCCgoIcmVzcG9uc2U=');
@$core.Deprecated('Use getRightOfUserRequestDescriptor instead')
const GetRightOfUserRequest$json = const {
  '1': 'GetRightOfUserRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'right', '3': 2, '4': 1, '5': 9, '10': 'right'},
  ],
};

/// Descriptor for `GetRightOfUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRightOfUserRequestDescriptor = $convert.base64Decode('ChVHZXRSaWdodE9mVXNlclJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhQKBXJpZ2h0GAIgASgJUgVyaWdodA==');
@$core.Deprecated('Use getRightOfUserResponseDescriptor instead')
const GetRightOfUserResponse$json = const {
  '1': 'GetRightOfUserResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.GetRightOfUserResponse.Right', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '3': const [GetRightOfUserResponse_Right$json],
  '8': const [
    const {'1': 'response'},
  ],
};

@$core.Deprecated('Use getRightOfUserResponseDescriptor instead')
const GetRightOfUserResponse_Right$json = const {
  '1': 'Right',
  '2': const [
    const {'1': 'has_right', '3': 1, '4': 1, '5': 8, '10': 'hasRight'},
    const {'1': 'right', '3': 2, '4': 1, '5': 9, '10': 'right'},
  ],
};

/// Descriptor for `GetRightOfUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRightOfUserResponseDescriptor = $convert.base64Decode('ChZHZXRSaWdodE9mVXNlclJlc3BvbnNlEkEKAm9rGAEgASgLMi8uYXV0aGVudGljYXRpb24udjEuR2V0UmlnaHRPZlVzZXJSZXNwb25zZS5SaWdodEgAUgJvaxItCgVlcnJvchgCIAEoCzIVLmVycm9ycy52MS5CYXNpY0Vycm9ySABSBWVycm9yGjoKBVJpZ2h0EhsKCWhhc19yaWdodBgBIAEoCFIIaGFzUmlnaHQSFAoFcmlnaHQYAiABKAlSBXJpZ2h0QgoKCHJlc3BvbnNl');
@$core.Deprecated('Use getRightsOfUserRequestDescriptor instead')
const GetRightsOfUserRequest$json = const {
  '1': 'GetRightsOfUserRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetRightsOfUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRightsOfUserRequestDescriptor = $convert.base64Decode('ChZHZXRSaWdodHNPZlVzZXJSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use getRightsOfUserResponseDescriptor instead')
const GetRightsOfUserResponse$json = const {
  '1': 'GetRightsOfUserResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.GetRightsOfUserResponse.Rights', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '3': const [GetRightsOfUserResponse_Rights$json],
  '8': const [
    const {'1': 'response'},
  ],
};

@$core.Deprecated('Use getRightsOfUserResponseDescriptor instead')
const GetRightsOfUserResponse_Rights$json = const {
  '1': 'Rights',
  '2': const [
    const {'1': 'rights', '3': 1, '4': 3, '5': 9, '10': 'rights'},
  ],
};

/// Descriptor for `GetRightsOfUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRightsOfUserResponseDescriptor = $convert.base64Decode('ChdHZXRSaWdodHNPZlVzZXJSZXNwb25zZRJDCgJvaxgBIAEoCzIxLmF1dGhlbnRpY2F0aW9uLnYxLkdldFJpZ2h0c09mVXNlclJlc3BvbnNlLlJpZ2h0c0gAUgJvaxItCgVlcnJvchgCIAEoCzIVLmVycm9ycy52MS5CYXNpY0Vycm9ySABSBWVycm9yGiAKBlJpZ2h0cxIWCgZyaWdodHMYASADKAlSBnJpZ2h0c0IKCghyZXNwb25zZQ==');
