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

class GetRightOfUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRightOfUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..hasRequiredFields = false
  ;

  GetRightOfUserRequest._() : super();
  factory GetRightOfUserRequest({
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
  factory GetRightOfUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRightOfUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRightOfUserRequest clone() => GetRightOfUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRightOfUserRequest copyWith(void Function(GetRightOfUserRequest) updates) => super.copyWith((message) => updates(message as GetRightOfUserRequest)) as GetRightOfUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRightOfUserRequest create() => GetRightOfUserRequest._();
  GetRightOfUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetRightOfUserRequest> createRepeated() => $pb.PbList<GetRightOfUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRightOfUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRightOfUserRequest>(create);
  static GetRightOfUserRequest? _defaultInstance;

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

class Right extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Right', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..hasRequiredFields = false
  ;

  Right._() : super();
  factory Right({
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
  factory Right.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Right.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Right clone() => Right()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Right copyWith(void Function(Right) updates) => super.copyWith((message) => updates(message as Right)) as Right; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Right create() => Right._();
  Right createEmptyInstance() => create();
  static $pb.PbList<Right> createRepeated() => $pb.PbList<Right>();
  @$core.pragma('dart2js:noInline')
  static Right getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Right>(create);
  static Right? _defaultInstance;

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

class GetRightOfUserResponse_HasRight extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRightOfUserResponse.HasRight', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasRight')
    ..hasRequiredFields = false
  ;

  GetRightOfUserResponse_HasRight._() : super();
  factory GetRightOfUserResponse_HasRight({
    $core.String? right,
    $core.String? userId,
    $core.bool? hasRight_3,
  }) {
    final _result = create();
    if (right != null) {
      _result.right = right;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (hasRight_3 != null) {
      _result.hasRight_3 = hasRight_3;
    }
    return _result;
  }
  factory GetRightOfUserResponse_HasRight.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRightOfUserResponse_HasRight.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRightOfUserResponse_HasRight clone() => GetRightOfUserResponse_HasRight()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRightOfUserResponse_HasRight copyWith(void Function(GetRightOfUserResponse_HasRight) updates) => super.copyWith((message) => updates(message as GetRightOfUserResponse_HasRight)) as GetRightOfUserResponse_HasRight; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRightOfUserResponse_HasRight create() => GetRightOfUserResponse_HasRight._();
  GetRightOfUserResponse_HasRight createEmptyInstance() => create();
  static $pb.PbList<GetRightOfUserResponse_HasRight> createRepeated() => $pb.PbList<GetRightOfUserResponse_HasRight>();
  @$core.pragma('dart2js:noInline')
  static GetRightOfUserResponse_HasRight getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRightOfUserResponse_HasRight>(create);
  static GetRightOfUserResponse_HasRight? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get right => $_getSZ(0);
  @$pb.TagNumber(1)
  set right($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRight() => $_has(0);
  @$pb.TagNumber(1)
  void clearRight() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get hasRight_3 => $_getBF(2);
  @$pb.TagNumber(3)
  set hasRight_3($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHasRight_3() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasRight_3() => clearField(3);
}

enum GetRightOfUserResponse_Response {
  ok, 
  error, 
  notSet
}

class GetRightOfUserResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetRightOfUserResponse_Response> _GetRightOfUserResponse_ResponseByTag = {
    1 : GetRightOfUserResponse_Response.ok,
    2 : GetRightOfUserResponse_Response.error,
    0 : GetRightOfUserResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRightOfUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<GetRightOfUserResponse_HasRight>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: GetRightOfUserResponse_HasRight.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  GetRightOfUserResponse._() : super();
  factory GetRightOfUserResponse({
    GetRightOfUserResponse_HasRight? ok,
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
  factory GetRightOfUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRightOfUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRightOfUserResponse clone() => GetRightOfUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRightOfUserResponse copyWith(void Function(GetRightOfUserResponse) updates) => super.copyWith((message) => updates(message as GetRightOfUserResponse)) as GetRightOfUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRightOfUserResponse create() => GetRightOfUserResponse._();
  GetRightOfUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetRightOfUserResponse> createRepeated() => $pb.PbList<GetRightOfUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRightOfUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRightOfUserResponse>(create);
  static GetRightOfUserResponse? _defaultInstance;

  GetRightOfUserResponse_Response whichResponse() => _GetRightOfUserResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GetRightOfUserResponse_HasRight get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(GetRightOfUserResponse_HasRight v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  GetRightOfUserResponse_HasRight ensureOk() => $_ensure(0);

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

class CreateRightOfUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateRightOfUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..hasRequiredFields = false
  ;

  CreateRightOfUserRequest._() : super();
  factory CreateRightOfUserRequest({
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
  factory CreateRightOfUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRightOfUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRightOfUserRequest clone() => CreateRightOfUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRightOfUserRequest copyWith(void Function(CreateRightOfUserRequest) updates) => super.copyWith((message) => updates(message as CreateRightOfUserRequest)) as CreateRightOfUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRightOfUserRequest create() => CreateRightOfUserRequest._();
  CreateRightOfUserRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRightOfUserRequest> createRepeated() => $pb.PbList<CreateRightOfUserRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRightOfUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRightOfUserRequest>(create);
  static CreateRightOfUserRequest? _defaultInstance;

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

enum CreateRightOfUserResponse_Response {
  ok, 
  error, 
  notSet
}

class CreateRightOfUserResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateRightOfUserResponse_Response> _CreateRightOfUserResponse_ResponseByTag = {
    1 : CreateRightOfUserResponse_Response.ok,
    2 : CreateRightOfUserResponse_Response.error,
    0 : CreateRightOfUserResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateRightOfUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Right>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: Right.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  CreateRightOfUserResponse._() : super();
  factory CreateRightOfUserResponse({
    Right? ok,
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
  factory CreateRightOfUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRightOfUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRightOfUserResponse clone() => CreateRightOfUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRightOfUserResponse copyWith(void Function(CreateRightOfUserResponse) updates) => super.copyWith((message) => updates(message as CreateRightOfUserResponse)) as CreateRightOfUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRightOfUserResponse create() => CreateRightOfUserResponse._();
  CreateRightOfUserResponse createEmptyInstance() => create();
  static $pb.PbList<CreateRightOfUserResponse> createRepeated() => $pb.PbList<CreateRightOfUserResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateRightOfUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRightOfUserResponse>(create);
  static CreateRightOfUserResponse? _defaultInstance;

  CreateRightOfUserResponse_Response whichResponse() => _CreateRightOfUserResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Right get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(Right v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  Right ensureOk() => $_ensure(0);

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

class DeleteRightOfUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteRightOfUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..hasRequiredFields = false
  ;

  DeleteRightOfUserRequest._() : super();
  factory DeleteRightOfUserRequest({
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
  factory DeleteRightOfUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRightOfUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRightOfUserRequest clone() => DeleteRightOfUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRightOfUserRequest copyWith(void Function(DeleteRightOfUserRequest) updates) => super.copyWith((message) => updates(message as DeleteRightOfUserRequest)) as DeleteRightOfUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteRightOfUserRequest create() => DeleteRightOfUserRequest._();
  DeleteRightOfUserRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRightOfUserRequest> createRepeated() => $pb.PbList<DeleteRightOfUserRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteRightOfUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRightOfUserRequest>(create);
  static DeleteRightOfUserRequest? _defaultInstance;

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

enum DeleteRightOfUserResponse_Response {
  ok, 
  error, 
  notSet
}

class DeleteRightOfUserResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DeleteRightOfUserResponse_Response> _DeleteRightOfUserResponse_ResponseByTag = {
    1 : DeleteRightOfUserResponse_Response.ok,
    2 : DeleteRightOfUserResponse_Response.error,
    0 : DeleteRightOfUserResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteRightOfUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Right>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: Right.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  DeleteRightOfUserResponse._() : super();
  factory DeleteRightOfUserResponse({
    Right? ok,
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
  factory DeleteRightOfUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRightOfUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRightOfUserResponse clone() => DeleteRightOfUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRightOfUserResponse copyWith(void Function(DeleteRightOfUserResponse) updates) => super.copyWith((message) => updates(message as DeleteRightOfUserResponse)) as DeleteRightOfUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteRightOfUserResponse create() => DeleteRightOfUserResponse._();
  DeleteRightOfUserResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteRightOfUserResponse> createRepeated() => $pb.PbList<DeleteRightOfUserResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteRightOfUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRightOfUserResponse>(create);
  static DeleteRightOfUserResponse? _defaultInstance;

  DeleteRightOfUserResponse_Response whichResponse() => _DeleteRightOfUserResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Right get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(Right v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  Right ensureOk() => $_ensure(0);

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

