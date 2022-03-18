///
//  Generated code. Do not modify.
//  source: errors/v1/errors.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'errors.pbenum.dart';

export 'errors.pbenum.dart';

class BasicError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BasicError', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'errors.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..e<BasicError_BasicErrorCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: BasicError_BasicErrorCode.BASIC_ERROR_CODE_UNSPECIFIED, valueOf: BasicError_BasicErrorCode.valueOf, enumValues: BasicError_BasicErrorCode.values)
    ..hasRequiredFields = false
  ;

  BasicError._() : super();
  factory BasicError({
    $core.String? message,
    BasicError_BasicErrorCode? code,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory BasicError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BasicError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BasicError clone() => BasicError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BasicError copyWith(void Function(BasicError) updates) => super.copyWith((message) => updates(message as BasicError)) as BasicError; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BasicError create() => BasicError._();
  BasicError createEmptyInstance() => create();
  static $pb.PbList<BasicError> createRepeated() => $pb.PbList<BasicError>();
  @$core.pragma('dart2js:noInline')
  static BasicError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BasicError>(create);
  static BasicError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  BasicError_BasicErrorCode get code => $_getN(1);
  @$pb.TagNumber(2)
  set code(BasicError_BasicErrorCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

