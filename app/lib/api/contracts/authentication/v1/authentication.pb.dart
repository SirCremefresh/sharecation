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

class RoleBinding extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoleBinding', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..hasRequiredFields = false
  ;

  RoleBinding._() : super();
  factory RoleBinding({
    $core.String? userId,
    $core.String? role,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (role != null) {
      _result.role = role;
    }
    return _result;
  }
  factory RoleBinding.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleBinding.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleBinding clone() => RoleBinding()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleBinding copyWith(void Function(RoleBinding) updates) => super.copyWith((message) => updates(message as RoleBinding)) as RoleBinding; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoleBinding create() => RoleBinding._();
  RoleBinding createEmptyInstance() => create();
  static $pb.PbList<RoleBinding> createRepeated() => $pb.PbList<RoleBinding>();
  @$core.pragma('dart2js:noInline')
  static RoleBinding getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoleBinding>(create);
  static RoleBinding? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get role => $_getSZ(1);
  @$pb.TagNumber(2)
  set role($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);
}

class Roles extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Roles', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roles')
    ..hasRequiredFields = false
  ;

  Roles._() : super();
  factory Roles({
    $core.Iterable<$core.String>? roles,
  }) {
    final _result = create();
    if (roles != null) {
      _result.roles.addAll(roles);
    }
    return _result;
  }
  factory Roles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Roles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Roles clone() => Roles()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Roles copyWith(void Function(Roles) updates) => super.copyWith((message) => updates(message as Roles)) as Roles; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Roles create() => Roles._();
  Roles createEmptyInstance() => create();
  static $pb.PbList<Roles> createRepeated() => $pb.PbList<Roles>();
  @$core.pragma('dart2js:noInline')
  static Roles getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Roles>(create);
  static Roles? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get roles => $_getList(0);
}

class CreateRoleBindingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateRoleBindingRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..hasRequiredFields = false
  ;

  CreateRoleBindingRequest._() : super();
  factory CreateRoleBindingRequest({
    $core.String? userId,
    $core.String? role,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (role != null) {
      _result.role = role;
    }
    return _result;
  }
  factory CreateRoleBindingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRoleBindingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRoleBindingRequest clone() => CreateRoleBindingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRoleBindingRequest copyWith(void Function(CreateRoleBindingRequest) updates) => super.copyWith((message) => updates(message as CreateRoleBindingRequest)) as CreateRoleBindingRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRoleBindingRequest create() => CreateRoleBindingRequest._();
  CreateRoleBindingRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRoleBindingRequest> createRepeated() => $pb.PbList<CreateRoleBindingRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRoleBindingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRoleBindingRequest>(create);
  static CreateRoleBindingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get role => $_getSZ(1);
  @$pb.TagNumber(2)
  set role($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);
}

enum CreateRoleBindingResponse_Response {
  ok, 
  error, 
  notSet
}

class CreateRoleBindingResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateRoleBindingResponse_Response> _CreateRoleBindingResponse_ResponseByTag = {
    1 : CreateRoleBindingResponse_Response.ok,
    2 : CreateRoleBindingResponse_Response.error,
    0 : CreateRoleBindingResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateRoleBindingResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<RoleBinding>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: RoleBinding.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  CreateRoleBindingResponse._() : super();
  factory CreateRoleBindingResponse({
    RoleBinding? ok,
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
  factory CreateRoleBindingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRoleBindingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRoleBindingResponse clone() => CreateRoleBindingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRoleBindingResponse copyWith(void Function(CreateRoleBindingResponse) updates) => super.copyWith((message) => updates(message as CreateRoleBindingResponse)) as CreateRoleBindingResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRoleBindingResponse create() => CreateRoleBindingResponse._();
  CreateRoleBindingResponse createEmptyInstance() => create();
  static $pb.PbList<CreateRoleBindingResponse> createRepeated() => $pb.PbList<CreateRoleBindingResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateRoleBindingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRoleBindingResponse>(create);
  static CreateRoleBindingResponse? _defaultInstance;

  CreateRoleBindingResponse_Response whichResponse() => _CreateRoleBindingResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RoleBinding get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(RoleBinding v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  RoleBinding ensureOk() => $_ensure(0);

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

class DeleteRoleBindingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteRoleBindingRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..hasRequiredFields = false
  ;

  DeleteRoleBindingRequest._() : super();
  factory DeleteRoleBindingRequest({
    $core.String? userId,
    $core.String? role,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (role != null) {
      _result.role = role;
    }
    return _result;
  }
  factory DeleteRoleBindingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRoleBindingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRoleBindingRequest clone() => DeleteRoleBindingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRoleBindingRequest copyWith(void Function(DeleteRoleBindingRequest) updates) => super.copyWith((message) => updates(message as DeleteRoleBindingRequest)) as DeleteRoleBindingRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteRoleBindingRequest create() => DeleteRoleBindingRequest._();
  DeleteRoleBindingRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRoleBindingRequest> createRepeated() => $pb.PbList<DeleteRoleBindingRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteRoleBindingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRoleBindingRequest>(create);
  static DeleteRoleBindingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get role => $_getSZ(1);
  @$pb.TagNumber(2)
  set role($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);
}

enum DeleteRoleBindingResponse_Response {
  ok, 
  error, 
  notSet
}

class DeleteRoleBindingResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DeleteRoleBindingResponse_Response> _DeleteRoleBindingResponse_ResponseByTag = {
    1 : DeleteRoleBindingResponse_Response.ok,
    2 : DeleteRoleBindingResponse_Response.error,
    0 : DeleteRoleBindingResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteRoleBindingResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<RoleBinding>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: RoleBinding.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  DeleteRoleBindingResponse._() : super();
  factory DeleteRoleBindingResponse({
    RoleBinding? ok,
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
  factory DeleteRoleBindingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRoleBindingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRoleBindingResponse clone() => DeleteRoleBindingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRoleBindingResponse copyWith(void Function(DeleteRoleBindingResponse) updates) => super.copyWith((message) => updates(message as DeleteRoleBindingResponse)) as DeleteRoleBindingResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteRoleBindingResponse create() => DeleteRoleBindingResponse._();
  DeleteRoleBindingResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteRoleBindingResponse> createRepeated() => $pb.PbList<DeleteRoleBindingResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteRoleBindingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRoleBindingResponse>(create);
  static DeleteRoleBindingResponse? _defaultInstance;

  DeleteRoleBindingResponse_Response whichResponse() => _DeleteRoleBindingResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RoleBinding get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(RoleBinding v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  RoleBinding ensureOk() => $_ensure(0);

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

class GetRolesOfUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRolesOfUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  GetRolesOfUserRequest._() : super();
  factory GetRolesOfUserRequest({
    $core.String? userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory GetRolesOfUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRolesOfUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRolesOfUserRequest clone() => GetRolesOfUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRolesOfUserRequest copyWith(void Function(GetRolesOfUserRequest) updates) => super.copyWith((message) => updates(message as GetRolesOfUserRequest)) as GetRolesOfUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRolesOfUserRequest create() => GetRolesOfUserRequest._();
  GetRolesOfUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetRolesOfUserRequest> createRepeated() => $pb.PbList<GetRolesOfUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRolesOfUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRolesOfUserRequest>(create);
  static GetRolesOfUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

enum GetRolesOfUserResponse_Response {
  ok, 
  error, 
  notSet
}

class GetRolesOfUserResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetRolesOfUserResponse_Response> _GetRolesOfUserResponse_ResponseByTag = {
    1 : GetRolesOfUserResponse_Response.ok,
    2 : GetRolesOfUserResponse_Response.error,
    0 : GetRolesOfUserResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRolesOfUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Roles>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: Roles.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  GetRolesOfUserResponse._() : super();
  factory GetRolesOfUserResponse({
    Roles? ok,
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
  factory GetRolesOfUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRolesOfUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRolesOfUserResponse clone() => GetRolesOfUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRolesOfUserResponse copyWith(void Function(GetRolesOfUserResponse) updates) => super.copyWith((message) => updates(message as GetRolesOfUserResponse)) as GetRolesOfUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRolesOfUserResponse create() => GetRolesOfUserResponse._();
  GetRolesOfUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetRolesOfUserResponse> createRepeated() => $pb.PbList<GetRolesOfUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRolesOfUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRolesOfUserResponse>(create);
  static GetRolesOfUserResponse? _defaultInstance;

  GetRolesOfUserResponse_Response whichResponse() => _GetRolesOfUserResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Roles get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(Roles v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  Roles ensureOk() => $_ensure(0);

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

