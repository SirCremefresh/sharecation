///
//  Generated code. Do not modify.
//  source: authentication/v1/public_jwk.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../errors/v1/errors.pb.dart' as $0;

class PublicJwk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PublicJwk', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'kid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jwk')
    ..hasRequiredFields = false
  ;

  PublicJwk._() : super();
  factory PublicJwk({
    $core.String? kid,
    $core.String? jwk,
  }) {
    final _result = create();
    if (kid != null) {
      _result.kid = kid;
    }
    if (jwk != null) {
      _result.jwk = jwk;
    }
    return _result;
  }
  factory PublicJwk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublicJwk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublicJwk clone() => PublicJwk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublicJwk copyWith(void Function(PublicJwk) updates) => super.copyWith((message) => updates(message as PublicJwk)) as PublicJwk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublicJwk create() => PublicJwk._();
  PublicJwk createEmptyInstance() => create();
  static $pb.PbList<PublicJwk> createRepeated() => $pb.PbList<PublicJwk>();
  @$core.pragma('dart2js:noInline')
  static PublicJwk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublicJwk>(create);
  static PublicJwk? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get kid => $_getSZ(0);
  @$pb.TagNumber(3)
  set kid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasKid() => $_has(0);
  @$pb.TagNumber(3)
  void clearKid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get jwk => $_getSZ(1);
  @$pb.TagNumber(4)
  set jwk($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasJwk() => $_has(1);
  @$pb.TagNumber(4)
  void clearJwk() => clearField(4);
}

class PublicJwks extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PublicJwks', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..pc<PublicJwk>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jwks', $pb.PbFieldType.PM, subBuilder: PublicJwk.create)
    ..hasRequiredFields = false
  ;

  PublicJwks._() : super();
  factory PublicJwks({
    $core.Iterable<PublicJwk>? jwks,
  }) {
    final _result = create();
    if (jwks != null) {
      _result.jwks.addAll(jwks);
    }
    return _result;
  }
  factory PublicJwks.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublicJwks.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublicJwks clone() => PublicJwks()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublicJwks copyWith(void Function(PublicJwks) updates) => super.copyWith((message) => updates(message as PublicJwks)) as PublicJwks; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublicJwks create() => PublicJwks._();
  PublicJwks createEmptyInstance() => create();
  static $pb.PbList<PublicJwks> createRepeated() => $pb.PbList<PublicJwks>();
  @$core.pragma('dart2js:noInline')
  static PublicJwks getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublicJwks>(create);
  static PublicJwks? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PublicJwk> get jwks => $_getList(0);
}

enum GetPublicJwksResponse_Response {
  ok, 
  error, 
  notSet
}

class GetPublicJwksResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetPublicJwksResponse_Response> _GetPublicJwksResponse_ResponseByTag = {
    1 : GetPublicJwksResponse_Response.ok,
    2 : GetPublicJwksResponse_Response.error,
    0 : GetPublicJwksResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPublicJwksResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<PublicJwks>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: PublicJwks.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  GetPublicJwksResponse._() : super();
  factory GetPublicJwksResponse({
    PublicJwks? ok,
    $0.BasicError? error,
  }) {
    final _result = create();
    if (ok != null) {
      _result.ok = ok;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory GetPublicJwksResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPublicJwksResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPublicJwksResponse clone() => GetPublicJwksResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPublicJwksResponse copyWith(void Function(GetPublicJwksResponse) updates) => super.copyWith((message) => updates(message as GetPublicJwksResponse)) as GetPublicJwksResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPublicJwksResponse create() => GetPublicJwksResponse._();
  GetPublicJwksResponse createEmptyInstance() => create();
  static $pb.PbList<GetPublicJwksResponse> createRepeated() => $pb.PbList<GetPublicJwksResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPublicJwksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPublicJwksResponse>(create);
  static GetPublicJwksResponse? _defaultInstance;

  GetPublicJwksResponse_Response whichResponse() => _GetPublicJwksResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  PublicJwks get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(PublicJwks v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  PublicJwks ensureOk() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.BasicError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($0.BasicError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
  @$pb.TagNumber(2)
  $0.BasicError ensureError() => $_ensure(1);
}

