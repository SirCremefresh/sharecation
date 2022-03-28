///
//  Generated code. Do not modify.
//  source: authentication/v1/authentication.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class UpdateRightOfUserRequest_MutationType extends $pb.ProtobufEnum {
  static const UpdateRightOfUserRequest_MutationType MUTATION_TYPE_UNSPECIFIED = UpdateRightOfUserRequest_MutationType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MUTATION_TYPE_UNSPECIFIED');
  static const UpdateRightOfUserRequest_MutationType MUTATION_TYPE_ADD = UpdateRightOfUserRequest_MutationType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MUTATION_TYPE_ADD');
  static const UpdateRightOfUserRequest_MutationType MUTATION_TYPE_DELETE = UpdateRightOfUserRequest_MutationType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MUTATION_TYPE_DELETE');

  static const $core.List<UpdateRightOfUserRequest_MutationType> values = <UpdateRightOfUserRequest_MutationType> [
    MUTATION_TYPE_UNSPECIFIED,
    MUTATION_TYPE_ADD,
    MUTATION_TYPE_DELETE,
  ];

  static final $core.Map<$core.int, UpdateRightOfUserRequest_MutationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UpdateRightOfUserRequest_MutationType? valueOf($core.int value) => _byValue[value];

  const UpdateRightOfUserRequest_MutationType._($core.int v, $core.String n) : super(v, n);
}

