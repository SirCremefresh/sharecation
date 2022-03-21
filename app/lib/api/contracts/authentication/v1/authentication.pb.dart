///
//  Generated code. Do not modify.
//  source: authentication/v1/authentication.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../errors/v1/errors.pb.dart' as $0;

import 'authentication.pbenum.dart';

export 'authentication.pbenum.dart';

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

class UpdateRightOfUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateRightOfUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right')
    ..e<UpdateRightOfUserRequest_MutationType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mutationType', $pb.PbFieldType.OE, defaultOrMaker: UpdateRightOfUserRequest_MutationType.MUTATION_TYPE_UNSPECIFIED, valueOf: UpdateRightOfUserRequest_MutationType.valueOf, enumValues: UpdateRightOfUserRequest_MutationType.values)
    ..hasRequiredFields = false
  ;

  UpdateRightOfUserRequest._() : super();
  factory UpdateRightOfUserRequest({
    $core.String? userId,
    $core.String? right,
    UpdateRightOfUserRequest_MutationType? mutationType,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (right != null) {
      _result.right = right;
    }
    if (mutationType != null) {
      _result.mutationType = mutationType;
    }
    return _result;
  }
  factory UpdateRightOfUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateRightOfUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateRightOfUserRequest clone() => UpdateRightOfUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateRightOfUserRequest copyWith(void Function(UpdateRightOfUserRequest) updates) => super.copyWith((message) => updates(message as UpdateRightOfUserRequest)) as UpdateRightOfUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateRightOfUserRequest create() => UpdateRightOfUserRequest._();
  UpdateRightOfUserRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateRightOfUserRequest> createRepeated() => $pb.PbList<UpdateRightOfUserRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateRightOfUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateRightOfUserRequest>(create);
  static UpdateRightOfUserRequest? _defaultInstance;

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

  @$pb.TagNumber(3)
  UpdateRightOfUserRequest_MutationType get mutationType => $_getN(2);
  @$pb.TagNumber(3)
  set mutationType(UpdateRightOfUserRequest_MutationType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMutationType() => $_has(2);
  @$pb.TagNumber(3)
  void clearMutationType() => clearField(3);
}

enum UpdateRightOfUserResponse_Response {
  ok, 
  error, 
  notSet
}

class UpdateRightOfUserResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UpdateRightOfUserResponse_Response> _UpdateRightOfUserResponse_ResponseByTag = {
    1 : UpdateRightOfUserResponse_Response.ok,
    2 : UpdateRightOfUserResponse_Response.error,
    0 : UpdateRightOfUserResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateRightOfUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok')
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  UpdateRightOfUserResponse._() : super();
  factory UpdateRightOfUserResponse({
    $core.String? ok,
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
  factory UpdateRightOfUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateRightOfUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateRightOfUserResponse clone() => UpdateRightOfUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateRightOfUserResponse copyWith(void Function(UpdateRightOfUserResponse) updates) => super.copyWith((message) => updates(message as UpdateRightOfUserResponse)) as UpdateRightOfUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateRightOfUserResponse create() => UpdateRightOfUserResponse._();
  UpdateRightOfUserResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateRightOfUserResponse> createRepeated() => $pb.PbList<UpdateRightOfUserResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateRightOfUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateRightOfUserResponse>(create);
  static UpdateRightOfUserResponse? _defaultInstance;

  UpdateRightOfUserResponse_Response whichResponse() => _UpdateRightOfUserResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get ok => $_getSZ(0);
  @$pb.TagNumber(1)
  set ok($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);

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

class GetRightOfUserResponse_Right extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRightOfUserResponse.Right', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasRight', protoName: 'hasRight')
    ..hasRequiredFields = false
  ;

  GetRightOfUserResponse_Right._() : super();
  factory GetRightOfUserResponse_Right({
    $core.bool? hasRight,
  }) {
    final _result = create();
    if (hasRight != null) {
      _result.hasRight = hasRight;
    }
    return _result;
  }
  factory GetRightOfUserResponse_Right.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRightOfUserResponse_Right.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRightOfUserResponse_Right clone() => GetRightOfUserResponse_Right()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRightOfUserResponse_Right copyWith(void Function(GetRightOfUserResponse_Right) updates) => super.copyWith((message) => updates(message as GetRightOfUserResponse_Right)) as GetRightOfUserResponse_Right; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRightOfUserResponse_Right create() => GetRightOfUserResponse_Right._();
  GetRightOfUserResponse_Right createEmptyInstance() => create();
  static $pb.PbList<GetRightOfUserResponse_Right> createRepeated() => $pb.PbList<GetRightOfUserResponse_Right>();
  @$core.pragma('dart2js:noInline')
  static GetRightOfUserResponse_Right getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRightOfUserResponse_Right>(create);
  static GetRightOfUserResponse_Right? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasRight => $_getBF(0);
  @$pb.TagNumber(1)
  set hasRight($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHasRight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasRight() => clearField(1);
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
    ..aOM<GetRightOfUserResponse_Right>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: GetRightOfUserResponse_Right.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  GetRightOfUserResponse._() : super();
  factory GetRightOfUserResponse({
    GetRightOfUserResponse_Right? ok,
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
  GetRightOfUserResponse_Right get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(GetRightOfUserResponse_Right v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  GetRightOfUserResponse_Right ensureOk() => $_ensure(0);

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

