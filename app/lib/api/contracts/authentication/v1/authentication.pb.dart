///
//  Generated code. Do not modify.
//  source: authentication/v1/authentication.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../errors/v1/errors.pb.dart' as $0;

class AuthenticatedData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthenticatedData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sub')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exp', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  AuthenticatedData._() : super();
  factory AuthenticatedData({
    $core.String? sub,
    $core.int? exp,
  }) {
    final _result = create();
    if (sub != null) {
      _result.sub = sub;
    }
    if (exp != null) {
      _result.exp = exp;
    }
    return _result;
  }
  factory AuthenticatedData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthenticatedData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthenticatedData clone() => AuthenticatedData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthenticatedData copyWith(void Function(AuthenticatedData) updates) => super.copyWith((message) => updates(message as AuthenticatedData)) as AuthenticatedData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthenticatedData create() => AuthenticatedData._();
  AuthenticatedData createEmptyInstance() => create();
  static $pb.PbList<AuthenticatedData> createRepeated() => $pb.PbList<AuthenticatedData>();
  @$core.pragma('dart2js:noInline')
  static AuthenticatedData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthenticatedData>(create);
  static AuthenticatedData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sub => $_getSZ(0);
  @$pb.TagNumber(1)
  set sub($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSub() => $_has(0);
  @$pb.TagNumber(1)
  void clearSub() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get exp => $_getIZ(1);
  @$pb.TagNumber(2)
  set exp($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExp() => $_has(1);
  @$pb.TagNumber(2)
  void clearExp() => clearField(2);
}

class Authenticated extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Authenticated', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jwtString')
    ..aOM<AuthenticatedData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: AuthenticatedData.create)
    ..hasRequiredFields = false
  ;

  Authenticated._() : super();
  factory Authenticated({
    $core.String? jwtString,
    AuthenticatedData? data,
  }) {
    final _result = create();
    if (jwtString != null) {
      _result.jwtString = jwtString;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory Authenticated.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Authenticated.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Authenticated clone() => Authenticated()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Authenticated copyWith(void Function(Authenticated) updates) => super.copyWith((message) => updates(message as Authenticated)) as Authenticated; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Authenticated create() => Authenticated._();
  Authenticated createEmptyInstance() => create();
  static $pb.PbList<Authenticated> createRepeated() => $pb.PbList<Authenticated>();
  @$core.pragma('dart2js:noInline')
  static Authenticated getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Authenticated>(create);
  static Authenticated? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jwtString => $_getSZ(0);
  @$pb.TagNumber(1)
  set jwtString($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJwtString() => $_has(0);
  @$pb.TagNumber(1)
  void clearJwtString() => clearField(1);

  @$pb.TagNumber(2)
  AuthenticatedData get data => $_getN(1);
  @$pb.TagNumber(2)
  set data(AuthenticatedData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  AuthenticatedData ensureData() => $_ensure(1);
}

class CreateAuthenticationWithFirebaseRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateAuthenticationWithFirebaseRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firebaseJwtString')
    ..hasRequiredFields = false
  ;

  CreateAuthenticationWithFirebaseRequest._() : super();
  factory CreateAuthenticationWithFirebaseRequest({
    $core.String? firebaseJwtString,
  }) {
    final _result = create();
    if (firebaseJwtString != null) {
      _result.firebaseJwtString = firebaseJwtString;
    }
    return _result;
  }
  factory CreateAuthenticationWithFirebaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAuthenticationWithFirebaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAuthenticationWithFirebaseRequest clone() => CreateAuthenticationWithFirebaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAuthenticationWithFirebaseRequest copyWith(void Function(CreateAuthenticationWithFirebaseRequest) updates) => super.copyWith((message) => updates(message as CreateAuthenticationWithFirebaseRequest)) as CreateAuthenticationWithFirebaseRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateAuthenticationWithFirebaseRequest create() => CreateAuthenticationWithFirebaseRequest._();
  CreateAuthenticationWithFirebaseRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAuthenticationWithFirebaseRequest> createRepeated() => $pb.PbList<CreateAuthenticationWithFirebaseRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAuthenticationWithFirebaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAuthenticationWithFirebaseRequest>(create);
  static CreateAuthenticationWithFirebaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firebaseJwtString => $_getSZ(0);
  @$pb.TagNumber(1)
  set firebaseJwtString($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirebaseJwtString() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirebaseJwtString() => clearField(1);
}

enum CreateAuthenticationWithFirebaseResponse_Response {
  ok, 
  error, 
  notSet
}

class CreateAuthenticationWithFirebaseResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateAuthenticationWithFirebaseResponse_Response> _CreateAuthenticationWithFirebaseResponse_ResponseByTag = {
    1 : CreateAuthenticationWithFirebaseResponse_Response.ok,
    2 : CreateAuthenticationWithFirebaseResponse_Response.error,
    0 : CreateAuthenticationWithFirebaseResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateAuthenticationWithFirebaseResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Authenticated>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: Authenticated.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  CreateAuthenticationWithFirebaseResponse._() : super();
  factory CreateAuthenticationWithFirebaseResponse({
    Authenticated? ok,
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
  factory CreateAuthenticationWithFirebaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAuthenticationWithFirebaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAuthenticationWithFirebaseResponse clone() => CreateAuthenticationWithFirebaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAuthenticationWithFirebaseResponse copyWith(void Function(CreateAuthenticationWithFirebaseResponse) updates) => super.copyWith((message) => updates(message as CreateAuthenticationWithFirebaseResponse)) as CreateAuthenticationWithFirebaseResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateAuthenticationWithFirebaseResponse create() => CreateAuthenticationWithFirebaseResponse._();
  CreateAuthenticationWithFirebaseResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAuthenticationWithFirebaseResponse> createRepeated() => $pb.PbList<CreateAuthenticationWithFirebaseResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAuthenticationWithFirebaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAuthenticationWithFirebaseResponse>(create);
  static CreateAuthenticationWithFirebaseResponse? _defaultInstance;

  CreateAuthenticationWithFirebaseResponse_Response whichResponse() => _CreateAuthenticationWithFirebaseResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Authenticated get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(Authenticated v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  Authenticated ensureOk() => $_ensure(0);

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

class GetHasRightBindingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetHasRightBindingRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..hasRequiredFields = false
  ;

  GetHasRightBindingRequest._() : super();
  factory GetHasRightBindingRequest({
    $core.String? userId,
    $core.String? right,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (right != null) {
      _result.right = right;
    }
    return _result;
  }
  factory GetHasRightBindingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHasRightBindingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHasRightBindingRequest clone() => GetHasRightBindingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHasRightBindingRequest copyWith(void Function(GetHasRightBindingRequest) updates) => super.copyWith((message) => updates(message as GetHasRightBindingRequest)) as GetHasRightBindingRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetHasRightBindingRequest create() => GetHasRightBindingRequest._();
  GetHasRightBindingRequest createEmptyInstance() => create();
  static $pb.PbList<GetHasRightBindingRequest> createRepeated() => $pb.PbList<GetHasRightBindingRequest>();
  @$core.pragma('dart2js:noInline')
  static GetHasRightBindingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHasRightBindingRequest>(create);
  static GetHasRightBindingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get right => $_getSZ(1);
  @$pb.TagNumber(2)
  set right($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRight() => $_has(1);
  @$pb.TagNumber(2)
  void clearRight() => clearField(2);
}

class GetHasRightBindingResponse_HasRightBinding extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetHasRightBindingResponse.HasRightBinding', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasRightBinding')
    ..hasRequiredFields = false
  ;

  GetHasRightBindingResponse_HasRightBinding._() : super();
  factory GetHasRightBindingResponse_HasRightBinding({
    $core.bool? hasRightBinding,
  }) {
    final _result = create();
    if (hasRightBinding != null) {
      _result.hasRightBinding = hasRightBinding;
    }
    return _result;
  }
  factory GetHasRightBindingResponse_HasRightBinding.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHasRightBindingResponse_HasRightBinding.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHasRightBindingResponse_HasRightBinding clone() => GetHasRightBindingResponse_HasRightBinding()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHasRightBindingResponse_HasRightBinding copyWith(void Function(GetHasRightBindingResponse_HasRightBinding) updates) => super.copyWith((message) => updates(message as GetHasRightBindingResponse_HasRightBinding)) as GetHasRightBindingResponse_HasRightBinding; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetHasRightBindingResponse_HasRightBinding create() => GetHasRightBindingResponse_HasRightBinding._();
  GetHasRightBindingResponse_HasRightBinding createEmptyInstance() => create();
  static $pb.PbList<GetHasRightBindingResponse_HasRightBinding> createRepeated() => $pb.PbList<GetHasRightBindingResponse_HasRightBinding>();
  @$core.pragma('dart2js:noInline')
  static GetHasRightBindingResponse_HasRightBinding getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHasRightBindingResponse_HasRightBinding>(create);
  static GetHasRightBindingResponse_HasRightBinding? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasRightBinding => $_getBF(0);
  @$pb.TagNumber(1)
  set hasRightBinding($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHasRightBinding() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasRightBinding() => clearField(1);
}

enum GetHasRightBindingResponse_Response {
  ok, 
  error, 
  notSet
}

class GetHasRightBindingResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetHasRightBindingResponse_Response> _GetHasRightBindingResponse_ResponseByTag = {
    1 : GetHasRightBindingResponse_Response.ok,
    2 : GetHasRightBindingResponse_Response.error,
    0 : GetHasRightBindingResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetHasRightBindingResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<GetHasRightBindingResponse_HasRightBinding>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: GetHasRightBindingResponse_HasRightBinding.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  GetHasRightBindingResponse._() : super();
  factory GetHasRightBindingResponse({
    GetHasRightBindingResponse_HasRightBinding? ok,
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
  factory GetHasRightBindingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHasRightBindingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHasRightBindingResponse clone() => GetHasRightBindingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHasRightBindingResponse copyWith(void Function(GetHasRightBindingResponse) updates) => super.copyWith((message) => updates(message as GetHasRightBindingResponse)) as GetHasRightBindingResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetHasRightBindingResponse create() => GetHasRightBindingResponse._();
  GetHasRightBindingResponse createEmptyInstance() => create();
  static $pb.PbList<GetHasRightBindingResponse> createRepeated() => $pb.PbList<GetHasRightBindingResponse>();
  @$core.pragma('dart2js:noInline')
  static GetHasRightBindingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHasRightBindingResponse>(create);
  static GetHasRightBindingResponse? _defaultInstance;

  GetHasRightBindingResponse_Response whichResponse() => _GetHasRightBindingResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GetHasRightBindingResponse_HasRightBinding get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(GetHasRightBindingResponse_HasRightBinding v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  GetHasRightBindingResponse_HasRightBinding ensureOk() => $_ensure(0);

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

class RightBinding extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RightBinding', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..hasRequiredFields = false
  ;

  RightBinding._() : super();
  factory RightBinding({
    $core.String? userId,
    $core.String? right,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (right != null) {
      _result.right = right;
    }
    return _result;
  }
  factory RightBinding.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RightBinding.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RightBinding clone() => RightBinding()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RightBinding copyWith(void Function(RightBinding) updates) => super.copyWith((message) => updates(message as RightBinding)) as RightBinding; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RightBinding create() => RightBinding._();
  RightBinding createEmptyInstance() => create();
  static $pb.PbList<RightBinding> createRepeated() => $pb.PbList<RightBinding>();
  @$core.pragma('dart2js:noInline')
  static RightBinding getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RightBinding>(create);
  static RightBinding? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get right => $_getSZ(1);
  @$pb.TagNumber(2)
  set right($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRight() => $_has(1);
  @$pb.TagNumber(2)
  void clearRight() => clearField(2);
}

class Rights extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Rights', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rights')
    ..hasRequiredFields = false
  ;

  Rights._() : super();
  factory Rights({
    $core.Iterable<$core.String>? rights,
  }) {
    final _result = create();
    if (rights != null) {
      _result.rights.addAll(rights);
    }
    return _result;
  }
  factory Rights.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Rights.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Rights clone() => Rights()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Rights copyWith(void Function(Rights) updates) => super.copyWith((message) => updates(message as Rights)) as Rights; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Rights create() => Rights._();
  Rights createEmptyInstance() => create();
  static $pb.PbList<Rights> createRepeated() => $pb.PbList<Rights>();
  @$core.pragma('dart2js:noInline')
  static Rights getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Rights>(create);
  static Rights? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get rights => $_getList(0);
}

class CreateRightBindingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateRightBindingRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..hasRequiredFields = false
  ;

  CreateRightBindingRequest._() : super();
  factory CreateRightBindingRequest({
    $core.String? userId,
    $core.String? right,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (right != null) {
      _result.right = right;
    }
    return _result;
  }
  factory CreateRightBindingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRightBindingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRightBindingRequest clone() => CreateRightBindingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRightBindingRequest copyWith(void Function(CreateRightBindingRequest) updates) => super.copyWith((message) => updates(message as CreateRightBindingRequest)) as CreateRightBindingRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRightBindingRequest create() => CreateRightBindingRequest._();
  CreateRightBindingRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRightBindingRequest> createRepeated() => $pb.PbList<CreateRightBindingRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRightBindingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRightBindingRequest>(create);
  static CreateRightBindingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get right => $_getSZ(1);
  @$pb.TagNumber(2)
  set right($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRight() => $_has(1);
  @$pb.TagNumber(2)
  void clearRight() => clearField(2);
}

enum CreateRightBindingResponse_Response {
  ok, 
  error, 
  notSet
}

class CreateRightBindingResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateRightBindingResponse_Response> _CreateRightBindingResponse_ResponseByTag = {
    1 : CreateRightBindingResponse_Response.ok,
    2 : CreateRightBindingResponse_Response.error,
    0 : CreateRightBindingResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateRightBindingResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<RightBinding>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: RightBinding.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  CreateRightBindingResponse._() : super();
  factory CreateRightBindingResponse({
    RightBinding? ok,
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
  factory CreateRightBindingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRightBindingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRightBindingResponse clone() => CreateRightBindingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRightBindingResponse copyWith(void Function(CreateRightBindingResponse) updates) => super.copyWith((message) => updates(message as CreateRightBindingResponse)) as CreateRightBindingResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRightBindingResponse create() => CreateRightBindingResponse._();
  CreateRightBindingResponse createEmptyInstance() => create();
  static $pb.PbList<CreateRightBindingResponse> createRepeated() => $pb.PbList<CreateRightBindingResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateRightBindingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRightBindingResponse>(create);
  static CreateRightBindingResponse? _defaultInstance;

  CreateRightBindingResponse_Response whichResponse() => _CreateRightBindingResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RightBinding get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(RightBinding v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  RightBinding ensureOk() => $_ensure(0);

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

class DeleteRightBindingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteRightBindingRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..hasRequiredFields = false
  ;

  DeleteRightBindingRequest._() : super();
  factory DeleteRightBindingRequest({
    $core.String? userId,
    $core.String? right,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (right != null) {
      _result.right = right;
    }
    return _result;
  }
  factory DeleteRightBindingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRightBindingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRightBindingRequest clone() => DeleteRightBindingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRightBindingRequest copyWith(void Function(DeleteRightBindingRequest) updates) => super.copyWith((message) => updates(message as DeleteRightBindingRequest)) as DeleteRightBindingRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteRightBindingRequest create() => DeleteRightBindingRequest._();
  DeleteRightBindingRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRightBindingRequest> createRepeated() => $pb.PbList<DeleteRightBindingRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteRightBindingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRightBindingRequest>(create);
  static DeleteRightBindingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get right => $_getSZ(1);
  @$pb.TagNumber(2)
  set right($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRight() => $_has(1);
  @$pb.TagNumber(2)
  void clearRight() => clearField(2);
}

enum DeleteRightBindingResponse_Response {
  ok, 
  error, 
  notSet
}

class DeleteRightBindingResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DeleteRightBindingResponse_Response> _DeleteRightBindingResponse_ResponseByTag = {
    1 : DeleteRightBindingResponse_Response.ok,
    2 : DeleteRightBindingResponse_Response.error,
    0 : DeleteRightBindingResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteRightBindingResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<RightBinding>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: RightBinding.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  DeleteRightBindingResponse._() : super();
  factory DeleteRightBindingResponse({
    RightBinding? ok,
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
  factory DeleteRightBindingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRightBindingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRightBindingResponse clone() => DeleteRightBindingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRightBindingResponse copyWith(void Function(DeleteRightBindingResponse) updates) => super.copyWith((message) => updates(message as DeleteRightBindingResponse)) as DeleteRightBindingResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteRightBindingResponse create() => DeleteRightBindingResponse._();
  DeleteRightBindingResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteRightBindingResponse> createRepeated() => $pb.PbList<DeleteRightBindingResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteRightBindingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRightBindingResponse>(create);
  static DeleteRightBindingResponse? _defaultInstance;

  DeleteRightBindingResponse_Response whichResponse() => _DeleteRightBindingResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RightBinding get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(RightBinding v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  RightBinding ensureOk() => $_ensure(0);

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

class GetRightsOfUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRightsOfUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  GetRightsOfUserRequest._() : super();
  factory GetRightsOfUserRequest({
    $core.String? userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory GetRightsOfUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRightsOfUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRightsOfUserRequest clone() => GetRightsOfUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRightsOfUserRequest copyWith(void Function(GetRightsOfUserRequest) updates) => super.copyWith((message) => updates(message as GetRightsOfUserRequest)) as GetRightsOfUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRightsOfUserRequest create() => GetRightsOfUserRequest._();
  GetRightsOfUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetRightsOfUserRequest> createRepeated() => $pb.PbList<GetRightsOfUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRightsOfUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRightsOfUserRequest>(create);
  static GetRightsOfUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

enum GetRightsOfUserResponse_Response {
  ok, 
  error, 
  notSet
}

class GetRightsOfUserResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetRightsOfUserResponse_Response> _GetRightsOfUserResponse_ResponseByTag = {
    1 : GetRightsOfUserResponse_Response.ok,
    2 : GetRightsOfUserResponse_Response.error,
    0 : GetRightsOfUserResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRightsOfUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Rights>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: Rights.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  GetRightsOfUserResponse._() : super();
  factory GetRightsOfUserResponse({
    Rights? ok,
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
  factory GetRightsOfUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRightsOfUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRightsOfUserResponse clone() => GetRightsOfUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRightsOfUserResponse copyWith(void Function(GetRightsOfUserResponse) updates) => super.copyWith((message) => updates(message as GetRightsOfUserResponse)) as GetRightsOfUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRightsOfUserResponse create() => GetRightsOfUserResponse._();
  GetRightsOfUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetRightsOfUserResponse> createRepeated() => $pb.PbList<GetRightsOfUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRightsOfUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRightsOfUserResponse>(create);
  static GetRightsOfUserResponse? _defaultInstance;

  GetRightsOfUserResponse_Response whichResponse() => _GetRightsOfUserResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Rights get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(Rights v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  Rights ensureOk() => $_ensure(0);

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

