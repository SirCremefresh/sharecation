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
