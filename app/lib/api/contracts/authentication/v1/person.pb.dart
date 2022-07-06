///
//  Generated code. Do not modify.
//  source: authentication/v1/person.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../errors/v1/errors.pb.dart' as $0;

class Person extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Person', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstname')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastname')
    ..hasRequiredFields = false
  ;

  Person._() : super();
  factory Person({
    $core.String? userId,
    $core.String? firstname,
    $core.String? lastname,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (firstname != null) {
      _result.firstname = firstname;
    }
    if (lastname != null) {
      _result.lastname = lastname;
    }
    return _result;
  }
  factory Person.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Person.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Person clone() => Person()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Person copyWith(void Function(Person) updates) => super.copyWith((message) => updates(message as Person)) as Person; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Person create() => Person._();
  Person createEmptyInstance() => create();
  static $pb.PbList<Person> createRepeated() => $pb.PbList<Person>();
  @$core.pragma('dart2js:noInline')
  static Person getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Person>(create);
  static Person? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstname => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstname() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastname => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastname() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastname() => clearField(3);
}

class UpsertPersonRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpsertPersonRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstname')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastname')
    ..hasRequiredFields = false
  ;

  UpsertPersonRequest._() : super();
  factory UpsertPersonRequest({
    $core.String? firstname,
    $core.String? lastname,
  }) {
    final _result = create();
    if (firstname != null) {
      _result.firstname = firstname;
    }
    if (lastname != null) {
      _result.lastname = lastname;
    }
    return _result;
  }
  factory UpsertPersonRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertPersonRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertPersonRequest clone() => UpsertPersonRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertPersonRequest copyWith(void Function(UpsertPersonRequest) updates) => super.copyWith((message) => updates(message as UpsertPersonRequest)) as UpsertPersonRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpsertPersonRequest create() => UpsertPersonRequest._();
  UpsertPersonRequest createEmptyInstance() => create();
  static $pb.PbList<UpsertPersonRequest> createRepeated() => $pb.PbList<UpsertPersonRequest>();
  @$core.pragma('dart2js:noInline')
  static UpsertPersonRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertPersonRequest>(create);
  static UpsertPersonRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstname => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstname() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastname => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastname() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastname() => clearField(2);
}

enum UpsertPersonResponse_Response {
  ok, 
  error, 
  notSet
}

class UpsertPersonResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UpsertPersonResponse_Response> _UpsertPersonResponse_ResponseByTag = {
    1 : UpsertPersonResponse_Response.ok,
    2 : UpsertPersonResponse_Response.error,
    0 : UpsertPersonResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpsertPersonResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Person>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: Person.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  UpsertPersonResponse._() : super();
  factory UpsertPersonResponse({
    Person? ok,
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
  factory UpsertPersonResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertPersonResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertPersonResponse clone() => UpsertPersonResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertPersonResponse copyWith(void Function(UpsertPersonResponse) updates) => super.copyWith((message) => updates(message as UpsertPersonResponse)) as UpsertPersonResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpsertPersonResponse create() => UpsertPersonResponse._();
  UpsertPersonResponse createEmptyInstance() => create();
  static $pb.PbList<UpsertPersonResponse> createRepeated() => $pb.PbList<UpsertPersonResponse>();
  @$core.pragma('dart2js:noInline')
  static UpsertPersonResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertPersonResponse>(create);
  static UpsertPersonResponse? _defaultInstance;

  UpsertPersonResponse_Response whichResponse() => _UpsertPersonResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Person get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(Person v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  Person ensureOk() => $_ensure(0);

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

class GetPersonOfUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPersonOfUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  GetPersonOfUserRequest._() : super();
  factory GetPersonOfUserRequest({
    $core.String? userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory GetPersonOfUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPersonOfUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPersonOfUserRequest clone() => GetPersonOfUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPersonOfUserRequest copyWith(void Function(GetPersonOfUserRequest) updates) => super.copyWith((message) => updates(message as GetPersonOfUserRequest)) as GetPersonOfUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPersonOfUserRequest create() => GetPersonOfUserRequest._();
  GetPersonOfUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetPersonOfUserRequest> createRepeated() => $pb.PbList<GetPersonOfUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPersonOfUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPersonOfUserRequest>(create);
  static GetPersonOfUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

enum GetPersonOfUserResponse_Response {
  ok, 
  error, 
  notSet
}

class GetPersonOfUserResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetPersonOfUserResponse_Response> _GetPersonOfUserResponse_ResponseByTag = {
    1 : GetPersonOfUserResponse_Response.ok,
    2 : GetPersonOfUserResponse_Response.error,
    0 : GetPersonOfUserResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPersonOfUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Person>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: Person.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  GetPersonOfUserResponse._() : super();
  factory GetPersonOfUserResponse({
    Person? ok,
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
  factory GetPersonOfUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPersonOfUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPersonOfUserResponse clone() => GetPersonOfUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPersonOfUserResponse copyWith(void Function(GetPersonOfUserResponse) updates) => super.copyWith((message) => updates(message as GetPersonOfUserResponse)) as GetPersonOfUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPersonOfUserResponse create() => GetPersonOfUserResponse._();
  GetPersonOfUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetPersonOfUserResponse> createRepeated() => $pb.PbList<GetPersonOfUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPersonOfUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPersonOfUserResponse>(create);
  static GetPersonOfUserResponse? _defaultInstance;

  GetPersonOfUserResponse_Response whichResponse() => _GetPersonOfUserResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Person get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(Person v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  Person ensureOk() => $_ensure(0);

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

