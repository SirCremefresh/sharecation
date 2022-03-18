///
//  Generated code. Do not modify.
//  source: errors/v1/errors.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class BasicError_BasicErrorCode extends $pb.ProtobufEnum {
  static const BasicError_BasicErrorCode BASIC_ERROR_CODE_UNSPECIFIED = BasicError_BasicErrorCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASIC_ERROR_CODE_UNSPECIFIED');
  static const BasicError_BasicErrorCode BASIC_ERROR_CODE_BAD_REQUEST = BasicError_BasicErrorCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASIC_ERROR_CODE_BAD_REQUEST');
  static const BasicError_BasicErrorCode BASIC_ERROR_CODE_UNAUTHENTICATED = BasicError_BasicErrorCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASIC_ERROR_CODE_UNAUTHENTICATED');
  static const BasicError_BasicErrorCode BASIC_ERROR_CODE_NOT_FOUND = BasicError_BasicErrorCode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASIC_ERROR_CODE_NOT_FOUND');
  static const BasicError_BasicErrorCode BASIC_ERROR_CODE_INTERNAL = BasicError_BasicErrorCode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASIC_ERROR_CODE_INTERNAL');
  static const BasicError_BasicErrorCode BASIC_ERROR_CODE_UNKNOWN = BasicError_BasicErrorCode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASIC_ERROR_CODE_UNKNOWN');

  static const $core.List<BasicError_BasicErrorCode> values = <BasicError_BasicErrorCode> [
    BASIC_ERROR_CODE_UNSPECIFIED,
    BASIC_ERROR_CODE_BAD_REQUEST,
    BASIC_ERROR_CODE_UNAUTHENTICATED,
    BASIC_ERROR_CODE_NOT_FOUND,
    BASIC_ERROR_CODE_INTERNAL,
    BASIC_ERROR_CODE_UNKNOWN,
  ];

  static final $core.Map<$core.int, BasicError_BasicErrorCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BasicError_BasicErrorCode? valueOf($core.int value) => _byValue[value];

  const BasicError_BasicErrorCode._($core.int v, $core.String n) : super(v, n);
}

