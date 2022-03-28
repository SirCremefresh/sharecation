///
//  Generated code. Do not modify.
//  source: pings/v1/pings.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Ping extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Ping', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pings.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pingId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  Ping._() : super();
  factory Ping({
    $core.String? pingId,
    $core.String? message,
  }) {
    final _result = create();
    if (pingId != null) {
      _result.pingId = pingId;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory Ping.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ping.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ping clone() => Ping()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ping copyWith(void Function(Ping) updates) => super.copyWith((message) => updates(message as Ping)) as Ping; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ping create() => Ping._();
  Ping createEmptyInstance() => create();
  static $pb.PbList<Ping> createRepeated() => $pb.PbList<Ping>();
  @$core.pragma('dart2js:noInline')
  static Ping getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ping>(create);
  static Ping? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pingId => $_getSZ(0);
  @$pb.TagNumber(1)
  set pingId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPingId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class GetPingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPingRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pings.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pingId')
    ..hasRequiredFields = false
  ;

  GetPingRequest._() : super();
  factory GetPingRequest({
    $core.String? pingId,
  }) {
    final _result = create();
    if (pingId != null) {
      _result.pingId = pingId;
    }
    return _result;
  }
  factory GetPingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPingRequest clone() => GetPingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPingRequest copyWith(void Function(GetPingRequest) updates) => super.copyWith((message) => updates(message as GetPingRequest)) as GetPingRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPingRequest create() => GetPingRequest._();
  GetPingRequest createEmptyInstance() => create();
  static $pb.PbList<GetPingRequest> createRepeated() => $pb.PbList<GetPingRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPingRequest>(create);
  static GetPingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pingId => $_getSZ(0);
  @$pb.TagNumber(1)
  set pingId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPingId() => clearField(1);
}

class GetPingResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPingResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pings.v1'), createEmptyInstance: create)
    ..aOM<Ping>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ping', subBuilder: Ping.create)
    ..hasRequiredFields = false
  ;

  GetPingResponse._() : super();
  factory GetPingResponse({
    Ping? ping,
  }) {
    final _result = create();
    if (ping != null) {
      _result.ping = ping;
    }
    return _result;
  }
  factory GetPingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPingResponse clone() => GetPingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPingResponse copyWith(void Function(GetPingResponse) updates) => super.copyWith((message) => updates(message as GetPingResponse)) as GetPingResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPingResponse create() => GetPingResponse._();
  GetPingResponse createEmptyInstance() => create();
  static $pb.PbList<GetPingResponse> createRepeated() => $pb.PbList<GetPingResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPingResponse>(create);
  static GetPingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Ping get ping => $_getN(0);
  @$pb.TagNumber(1)
  set ping(Ping v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPing() => $_has(0);
  @$pb.TagNumber(1)
  void clearPing() => clearField(1);
  @$pb.TagNumber(1)
  Ping ensurePing() => $_ensure(0);
}

