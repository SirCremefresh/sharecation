///
//  Generated code. Do not modify.
//  source: images/v1/images.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use imageDescriptor instead')
const Image$json = const {
  '1': 'Image',
  '2': const [
    const {'1': 'image_id', '3': 1, '4': 1, '5': 9, '10': 'imageId'},
    const {'1': 'external_id', '3': 2, '4': 1, '5': 9, '10': 'externalId'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Image`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDescriptor = $convert.base64Decode('CgVJbWFnZRIZCghpbWFnZV9pZBgBIAEoCVIHaW1hZ2VJZBIfCgtleHRlcm5hbF9pZBgCIAEoCVIKZXh0ZXJuYWxJZBIQCgN1cmwYAyABKAlSA3VybA==');
@$core.Deprecated('Use imagesDescriptor instead')
const Images$json = const {
  '1': 'Images',
  '2': const [
    const {'1': 'images', '3': 1, '4': 3, '5': 11, '6': '.images.v1.Image', '10': 'images'},
    const {'1': 'cursor', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'cursor', '17': true},
  ],
  '8': const [
    const {'1': '_cursor'},
  ],
};

/// Descriptor for `Images`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imagesDescriptor = $convert.base64Decode('CgZJbWFnZXMSKAoGaW1hZ2VzGAEgAygLMhAuaW1hZ2VzLnYxLkltYWdlUgZpbWFnZXMSGwoGY3Vyc29yGAIgASgJSABSBmN1cnNvcogBAUIJCgdfY3Vyc29y');
@$core.Deprecated('Use getImagesByGroupIdRequestDescriptor instead')
const GetImagesByGroupIdRequest$json = const {
  '1': 'GetImagesByGroupIdRequest',
  '2': const [
    const {'1': 'group_id', '3': 1, '4': 1, '5': 9, '10': 'groupId'},
    const {'1': 'cursor', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'cursor', '17': true},
  ],
  '8': const [
    const {'1': '_cursor'},
  ],
};

/// Descriptor for `GetImagesByGroupIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getImagesByGroupIdRequestDescriptor = $convert.base64Decode('ChlHZXRJbWFnZXNCeUdyb3VwSWRSZXF1ZXN0EhkKCGdyb3VwX2lkGAEgASgJUgdncm91cElkEhsKBmN1cnNvchgCIAEoCUgAUgZjdXJzb3KIAQFCCQoHX2N1cnNvcg==');
@$core.Deprecated('Use getImagesByGroupIdResponseDescriptor instead')
const GetImagesByGroupIdResponse$json = const {
  '1': 'GetImagesByGroupIdResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.images.v1.Images', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `GetImagesByGroupIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getImagesByGroupIdResponseDescriptor = $convert.base64Decode('ChpHZXRJbWFnZXNCeUdyb3VwSWRSZXNwb25zZRIjCgJvaxgBIAEoCzIRLmltYWdlcy52MS5JbWFnZXNIAFICb2sSLQoFZXJyb3IYAiABKAsyFS5lcnJvcnMudjEuQmFzaWNFcnJvckgAUgVlcnJvckIKCghyZXNwb25zZQ==');
@$core.Deprecated('Use createImageResponseDescriptor instead')
const CreateImageResponse$json = const {
  '1': 'CreateImageResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 11, '6': '.images.v1.Image', '9': 0, '10': 'ok'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.errors.v1.BasicError', '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `CreateImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createImageResponseDescriptor = $convert.base64Decode('ChNDcmVhdGVJbWFnZVJlc3BvbnNlEiIKAm9rGAEgASgLMhAuaW1hZ2VzLnYxLkltYWdlSABSAm9rEi0KBWVycm9yGAIgASgLMhUuZXJyb3JzLnYxLkJhc2ljRXJyb3JIAFIFZXJyb3JCCgoIcmVzcG9uc2U=');
