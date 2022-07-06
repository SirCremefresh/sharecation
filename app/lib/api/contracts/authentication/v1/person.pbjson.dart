///
//  Generated code. Do not modify.
//  source: authentication/v1/person.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use personDescriptor instead')
const Person$json = const {
  '1': 'Person',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'firstname', '3': 2, '4': 1, '5': 9, '10': 'firstname'},
    const {'1': 'lastname', '3': 3, '4': 1, '5': 9, '10': 'lastname'},
  ],
};

/// Descriptor for `Person`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personDescriptor = $convert.base64Decode('CgZQZXJzb24SFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhwKCWZpcnN0bmFtZRgCIAEoCVIJZmlyc3RuYW1lEhoKCGxhc3RuYW1lGAMgASgJUghsYXN0bmFtZQ==');
@$core.Deprecated('Use upsertPersonRequestDescriptor instead')
const UpsertPersonRequest$json = const {
  '1': 'UpsertPersonRequest',
  '2': const [
    const {'1': 'firstname', '3': 1, '4': 1, '5': 9, '10': 'firstname'},
    const {'1': 'lastname', '3': 2, '4': 1, '5': 9, '10': 'lastname'},
  ],
};

/// Descriptor for `UpsertPersonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertPersonRequestDescriptor = $convert.base64Decode('ChNVcHNlcnRQZXJzb25SZXF1ZXN0EhwKCWZpcnN0bmFtZRgBIAEoCVIJZmlyc3RuYW1lEhoKCGxhc3RuYW1lGAIgASgJUghsYXN0bmFtZQ==');
@$core.Deprecated('Use upsertPersonResponseDescriptor instead')
const UpsertPersonResponse$json = const {
  '1': 'UpsertPersonResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.Person', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `UpsertPersonResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertPersonResponseDescriptor = $convert.base64Decode('ChRVcHNlcnRQZXJzb25SZXNwb25zZRIrCgJvaxgBIAEoCzIZLmF1dGhlbnRpY2F0aW9uLnYxLlBlcnNvbkgAUgJvaxItCgVlcnJvchgCIAEoCzIVLmVycm9ycy52MS5CYXNpY0Vycm9ySABSBWVycm9yQgoKCHJlc3BvbnNl');
@$core.Deprecated('Use getPersonOfUserRequestDescriptor instead')
const GetPersonOfUserRequest$json = const {
  '1': 'GetPersonOfUserRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetPersonOfUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPersonOfUserRequestDescriptor = $convert.base64Decode('ChZHZXRQZXJzb25PZlVzZXJSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use getPersonOfUserResponseDescriptor instead')
const GetPersonOfUserResponse$json = const {
  '1': 'GetPersonOfUserResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.authentication.v1.Person', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `GetPersonOfUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPersonOfUserResponseDescriptor = $convert.base64Decode('ChdHZXRQZXJzb25PZlVzZXJSZXNwb25zZRIrCgJvaxgBIAEoCzIZLmF1dGhlbnRpY2F0aW9uLnYxLlBlcnNvbkgAUgJvaxItCgVlcnJvchgCIAEoCzIVLmVycm9ycy52MS5CYXNpY0Vycm9ySABSBWVycm9yQgoKCHJlc3BvbnNl');
