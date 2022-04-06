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
@$core.Deprecated('Use getHasRightBindingRequestDescriptor instead')
const GetHasRightBindingRequest$json = const {
  '1': 'GetHasRightBindingRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'right', '3': 2, '4': 1, '5': 9, '10': 'right'},
  ],
};

/// Descriptor for `GetHasRightBindingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHasRightBindingRequestDescriptor = $convert.base64Decode('ChlHZXRIYXNSaWdodEJpbmRpbmdSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIUCgVyaWdodBgCIAEoCVIFcmlnaHQ=');
@$core.Deprecated('Use getHasRightBindingResponseDescriptor instead')
const GetHasRightBindingResponse$json = const {
  '1': 'GetHasRightBindingResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.GetHasRightBindingResponse.HasRightBinding', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '3': const [GetHasRightBindingResponse_HasRightBinding$json],
  '8': const [
    const {'1': 'response'},
  ],
};

@$core.Deprecated('Use getHasRightBindingResponseDescriptor instead')
const GetHasRightBindingResponse_HasRightBinding$json = const {
  '1': 'HasRightBinding',
  '2': const [
    const {'1': 'has_right_binding', '3': 1, '4': 1, '5': 8, '10': 'hasRightBinding'},
  ],
};

/// Descriptor for `GetHasRightBindingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHasRightBindingResponseDescriptor = $convert.base64Decode('ChpHZXRIYXNSaWdodEJpbmRpbmdSZXNwb25zZRJPCgJvaxgBIAEoCzI9LmF1dGhlbnRpY2F0aW9uLnYxLkdldEhhc1JpZ2h0QmluZGluZ1Jlc3BvbnNlLkhhc1JpZ2h0QmluZGluZ0gAUgJvaxItCgVlcnJvchgCIAEoCzIVLmVycm9ycy52MS5CYXNpY0Vycm9ySABSBWVycm9yGj0KD0hhc1JpZ2h0QmluZGluZxIqChFoYXNfcmlnaHRfYmluZGluZxgBIAEoCFIPaGFzUmlnaHRCaW5kaW5nQgoKCHJlc3BvbnNl');
@$core.Deprecated('Use rightBindingDescriptor instead')
const RightBinding$json = const {
  '1': 'RightBinding',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'right', '3': 2, '4': 1, '5': 9, '10': 'right'},
  ],
};

/// Descriptor for `RightBinding`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rightBindingDescriptor = $convert.base64Decode('CgxSaWdodEJpbmRpbmcSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhQKBXJpZ2h0GAIgASgJUgVyaWdodA==');
@$core.Deprecated('Use rightsDescriptor instead')
const Rights$json = const {
  '1': 'Rights',
  '2': const [
    const {'1': 'rights', '3': 1, '4': 3, '5': 9, '10': 'rights'},
  ],
};

/// Descriptor for `Rights`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rightsDescriptor = $convert.base64Decode('CgZSaWdodHMSFgoGcmlnaHRzGAEgAygJUgZyaWdodHM=');
@$core.Deprecated('Use createRightBindingRequestDescriptor instead')
const CreateRightBindingRequest$json = const {
  '1': 'CreateRightBindingRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'right', '3': 2, '4': 1, '5': 9, '10': 'right'},
  ],
};

/// Descriptor for `CreateRightBindingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRightBindingRequestDescriptor = $convert.base64Decode('ChlDcmVhdGVSaWdodEJpbmRpbmdSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIUCgVyaWdodBgCIAEoCVIFcmlnaHQ=');
@$core.Deprecated('Use createRightBindingResponseDescriptor instead')
const CreateRightBindingResponse$json = const {
  '1': 'CreateRightBindingResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.RightBinding', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `CreateRightBindingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRightBindingResponseDescriptor = $convert.base64Decode('ChpDcmVhdGVSaWdodEJpbmRpbmdSZXNwb25zZRIxCgJvaxgBIAEoCzIfLmF1dGhlbnRpY2F0aW9uLnYxLlJpZ2h0QmluZGluZ0gAUgJvaxItCgVlcnJvchgCIAEoCzIVLmVycm9ycy52MS5CYXNpY0Vycm9ySABSBWVycm9yQgoKCHJlc3BvbnNl');
@$core.Deprecated('Use deleteRightBindingRequestDescriptor instead')
const DeleteRightBindingRequest$json = const {
  '1': 'DeleteRightBindingRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'right', '3': 2, '4': 1, '5': 9, '10': 'right'},
  ],
};

/// Descriptor for `DeleteRightBindingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRightBindingRequestDescriptor = $convert.base64Decode('ChlEZWxldGVSaWdodEJpbmRpbmdSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIUCgVyaWdodBgCIAEoCVIFcmlnaHQ=');
@$core.Deprecated('Use deleteRightBindingResponseDescriptor instead')
const DeleteRightBindingResponse$json = const {
  '1': 'DeleteRightBindingResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.RightBinding', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `DeleteRightBindingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRightBindingResponseDescriptor = $convert.base64Decode('ChpEZWxldGVSaWdodEJpbmRpbmdSZXNwb25zZRIxCgJvaxgBIAEoCzIfLmF1dGhlbnRpY2F0aW9uLnYxLlJpZ2h0QmluZGluZ0gAUgJvaxItCgVlcnJvchgCIAEoCzIVLmVycm9ycy52MS5CYXNpY0Vycm9ySABSBWVycm9yQgoKCHJlc3BvbnNl');
@$core.Deprecated('Use getRightBindingsRequestDescriptor instead')
const GetRightBindingsRequest$json = const {
  '1': 'GetRightBindingsRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetRightBindingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRightBindingsRequestDescriptor = $convert.base64Decode('ChdHZXRSaWdodEJpbmRpbmdzUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');
@$core.Deprecated('Use getRightBindingsResponseDescriptor instead')
const GetRightBindingsResponse$json = const {
  '1': 'GetRightBindingsResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.Rights', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `GetRightBindingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRightBindingsResponseDescriptor = $convert.base64Decode('ChhHZXRSaWdodEJpbmRpbmdzUmVzcG9uc2USKwoCb2sYASABKAsyGS5hdXRoZW50aWNhdGlvbi52MS5SaWdodHNIAFICb2sSLQoFZXJyb3IYAiABKAsyFS5lcnJvcnMudjEuQmFzaWNFcnJvckgAUgVlcnJvckIKCghyZXNwb25zZQ==');
