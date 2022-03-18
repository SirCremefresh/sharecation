///
//  Generated code. Do not modify.
//  source: errors/v1/errors.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use basicErrorDescriptor instead')
const BasicError$json = const {
  '1': 'BasicError',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.errors.v1.BasicError.BasicErrorCode', '10': 'code'},
  ],
  '4': const [BasicError_BasicErrorCode$json],
};

@$core.Deprecated('Use basicErrorDescriptor instead')
const BasicError_BasicErrorCode$json = const {
  '1': 'BasicErrorCode',
  '2': const [
    const {'1': 'BASIC_ERROR_CODE_UNSPECIFIED', '2': 0},
    const {'1': 'BASIC_ERROR_CODE_BAD_REQUEST', '2': 1},
    const {'1': 'BASIC_ERROR_CODE_UNAUTHENTICATED', '2': 2},
    const {'1': 'BASIC_ERROR_CODE_NOT_FOUND', '2': 3},
    const {'1': 'BASIC_ERROR_CODE_INTERNAL', '2': 4},
    const {'1': 'BASIC_ERROR_CODE_UNKNOWN', '2': 5},
  ],
};

/// Descriptor for `BasicError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List basicErrorDescriptor = $convert.base64Decode('CgpCYXNpY0Vycm9yEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2USOAoEY29kZRgCIAEoDjIkLmVycm9ycy52MS5CYXNpY0Vycm9yLkJhc2ljRXJyb3JDb2RlUgRjb2RlItcBCg5CYXNpY0Vycm9yQ29kZRIgChxCQVNJQ19FUlJPUl9DT0RFX1VOU1BFQ0lGSUVEEAASIAocQkFTSUNfRVJST1JfQ09ERV9CQURfUkVRVUVTVBABEiQKIEJBU0lDX0VSUk9SX0NPREVfVU5BVVRIRU5USUNBVEVEEAISHgoaQkFTSUNfRVJST1JfQ09ERV9OT1RfRk9VTkQQAxIdChlCQVNJQ19FUlJPUl9DT0RFX0lOVEVSTkFMEAQSHAoYQkFTSUNfRVJST1JfQ09ERV9VTktOT1dOEAU=');
