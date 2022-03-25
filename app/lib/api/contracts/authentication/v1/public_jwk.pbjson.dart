///
//  Generated code. Do not modify.
//  source: authentication/v1/public_jwk.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use publicJwkDescriptor instead')
const PublicJwk$json = const {
  '1': 'PublicJwk',
  '2': const [
    const {'1': 'kid', '3': 3, '4': 1, '5': 9, '10': 'kid'},
    const {'1': 'jwk', '3': 4, '4': 1, '5': 9, '10': 'jwk'},
  ],
};

/// Descriptor for `PublicJwk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicJwkDescriptor = $convert.base64Decode('CglQdWJsaWNKd2sSEAoDa2lkGAMgASgJUgNraWQSEAoDandrGAQgASgJUgNqd2s=');
@$core.Deprecated('Use publicJwksDescriptor instead')
const PublicJwks$json = const {
  '1': 'PublicJwks',
  '2': const [
    const {'1': 'jwks', '3': 1, '4': 3, '5': 11, '6': '.authentication.v1.PublicJwk', '10': 'jwks'},
  ],
};

/// Descriptor for `PublicJwks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicJwksDescriptor = $convert.base64Decode('CgpQdWJsaWNKd2tzEjAKBGp3a3MYASADKAsyHC5hdXRoZW50aWNhdGlvbi52MS5QdWJsaWNKd2tSBGp3a3M=');
@$core.Deprecated('Use getPublicJwksResponseDescriptor instead')
const GetPublicJwksResponse$json = const {
  '1': 'GetPublicJwksResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.PublicJwks', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `GetPublicJwksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPublicJwksResponseDescriptor = $convert.base64Decode('ChVHZXRQdWJsaWNKd2tzUmVzcG9uc2USLwoCb2sYASABKAsyHS5hdXRoZW50aWNhdGlvbi52MS5QdWJsaWNKd2tzSABSAm9rEi0KBWVycm9yGAIgASgLMhUuZXJyb3JzLnYxLkJhc2ljRXJyb3JIAFIFZXJyb3JCCgoIcmVzcG9uc2U=');
