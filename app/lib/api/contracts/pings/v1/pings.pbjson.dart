///
//  Generated code. Do not modify.
//  source: pings/v1/pings.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use pingDescriptor instead')
const Ping$json = const {
  '1': 'Ping',
  '2': const [
    const {'1': 'ping_id', '3': 1, '4': 1, '5': 9, '10': 'pingId'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Ping`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingDescriptor = $convert.base64Decode('CgRQaW5nEhcKB3BpbmdfaWQYASABKAlSBnBpbmdJZBIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use getPingRequestDescriptor instead')
const GetPingRequest$json = const {
  '1': 'GetPingRequest',
  '2': const [
    const {'1': 'ping_id', '3': 1, '4': 1, '5': 9, '10': 'pingId'},
  ],
};

/// Descriptor for `GetPingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPingRequestDescriptor = $convert.base64Decode('Cg5HZXRQaW5nUmVxdWVzdBIXCgdwaW5nX2lkGAEgASgJUgZwaW5nSWQ=');
@$core.Deprecated('Use getPingResponseDescriptor instead')
const GetPingResponse$json = const {
  '1': 'GetPingResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.pings.v1.Ping', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `GetPingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPingResponseDescriptor = $convert.base64Decode('Cg9HZXRQaW5nUmVzcG9uc2USIAoCb2sYASABKAsyDi5waW5ncy52MS5QaW5nSABSAm9rEi0KBWVycm9yGAIgASgLMhUuZXJyb3JzLnYxLkJhc2ljRXJyb3JIAFIFZXJyb3JCCgoIcmVzcG9uc2U=');
