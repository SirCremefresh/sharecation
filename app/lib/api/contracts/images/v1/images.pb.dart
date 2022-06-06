///
//  Generated code. Do not modify.
//  source: images/v1/images.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../errors/v1/errors.pb.dart' as $0;

class Image extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Image', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'images.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'externalId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..hasRequiredFields = false
  ;

  Image._() : super();
  factory Image({
    $core.String? imageId,
    $core.String? externalId,
    $core.String? url,
  }) {
    final _result = create();
    if (imageId != null) {
      _result.imageId = imageId;
    }
    if (externalId != null) {
      _result.externalId = externalId;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory Image.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Image.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Image clone() => Image()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Image copyWith(void Function(Image) updates) => super.copyWith((message) => updates(message as Image)) as Image; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Image create() => Image._();
  Image createEmptyInstance() => create();
  static $pb.PbList<Image> createRepeated() => $pb.PbList<Image>();
  @$core.pragma('dart2js:noInline')
  static Image getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Image>(create);
  static Image? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get externalId => $_getSZ(1);
  @$pb.TagNumber(2)
  set externalId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExternalId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExternalId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);
}

class Images extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Images', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'images.v1'), createEmptyInstance: create)
    ..pc<Image>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'images', $pb.PbFieldType.PM, subBuilder: Image.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cursor')
    ..hasRequiredFields = false
  ;

  Images._() : super();
  factory Images({
    $core.Iterable<Image>? images,
    $core.String? cursor,
  }) {
    final _result = create();
    if (images != null) {
      _result.images.addAll(images);
    }
    if (cursor != null) {
      _result.cursor = cursor;
    }
    return _result;
  }
  factory Images.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Images.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Images clone() => Images()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Images copyWith(void Function(Images) updates) => super.copyWith((message) => updates(message as Images)) as Images; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Images create() => Images._();
  Images createEmptyInstance() => create();
  static $pb.PbList<Images> createRepeated() => $pb.PbList<Images>();
  @$core.pragma('dart2js:noInline')
  static Images getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Images>(create);
  static Images? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Image> get images => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get cursor => $_getSZ(1);
  @$pb.TagNumber(2)
  set cursor($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(2)
  void clearCursor() => clearField(2);
}

class GetImagesByGroupIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetImagesByGroupIdRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'images.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cursor')
    ..hasRequiredFields = false
  ;

  GetImagesByGroupIdRequest._() : super();
  factory GetImagesByGroupIdRequest({
    $core.String? groupId,
    $core.String? cursor,
  }) {
    final _result = create();
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (cursor != null) {
      _result.cursor = cursor;
    }
    return _result;
  }
  factory GetImagesByGroupIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetImagesByGroupIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetImagesByGroupIdRequest clone() => GetImagesByGroupIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetImagesByGroupIdRequest copyWith(void Function(GetImagesByGroupIdRequest) updates) => super.copyWith((message) => updates(message as GetImagesByGroupIdRequest)) as GetImagesByGroupIdRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetImagesByGroupIdRequest create() => GetImagesByGroupIdRequest._();
  GetImagesByGroupIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetImagesByGroupIdRequest> createRepeated() => $pb.PbList<GetImagesByGroupIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetImagesByGroupIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetImagesByGroupIdRequest>(create);
  static GetImagesByGroupIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cursor => $_getSZ(1);
  @$pb.TagNumber(2)
  set cursor($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(2)
  void clearCursor() => clearField(2);
}

enum GetImagesByGroupIdResponse_Response {
  ok, 
  error, 
  notSet
}

class GetImagesByGroupIdResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetImagesByGroupIdResponse_Response> _GetImagesByGroupIdResponse_ResponseByTag = {
    1 : GetImagesByGroupIdResponse_Response.ok,
    2 : GetImagesByGroupIdResponse_Response.error,
    0 : GetImagesByGroupIdResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetImagesByGroupIdResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'images.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Images>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: Images.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  GetImagesByGroupIdResponse._() : super();
  factory GetImagesByGroupIdResponse({
    Images? ok,
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
  factory GetImagesByGroupIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetImagesByGroupIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetImagesByGroupIdResponse clone() => GetImagesByGroupIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetImagesByGroupIdResponse copyWith(void Function(GetImagesByGroupIdResponse) updates) => super.copyWith((message) => updates(message as GetImagesByGroupIdResponse)) as GetImagesByGroupIdResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetImagesByGroupIdResponse create() => GetImagesByGroupIdResponse._();
  GetImagesByGroupIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetImagesByGroupIdResponse> createRepeated() => $pb.PbList<GetImagesByGroupIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetImagesByGroupIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetImagesByGroupIdResponse>(create);
  static GetImagesByGroupIdResponse? _defaultInstance;

  GetImagesByGroupIdResponse_Response whichResponse() => _GetImagesByGroupIdResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Images get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(Images v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  Images ensureOk() => $_ensure(0);

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

enum CreateImageResponse_Response {
  ok, 
  error, 
  notSet
}

class CreateImageResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateImageResponse_Response> _CreateImageResponse_ResponseByTag = {
    1 : CreateImageResponse_Response.ok,
    2 : CreateImageResponse_Response.error,
    0 : CreateImageResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateImageResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'images.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Image>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok', subBuilder: Image.create)
    ..aOM<$0.BasicError>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: $0.BasicError.create)
    ..hasRequiredFields = false
  ;

  CreateImageResponse._() : super();
  factory CreateImageResponse({
    Image? ok,
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
  factory CreateImageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateImageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateImageResponse clone() => CreateImageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateImageResponse copyWith(void Function(CreateImageResponse) updates) => super.copyWith((message) => updates(message as CreateImageResponse)) as CreateImageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateImageResponse create() => CreateImageResponse._();
  CreateImageResponse createEmptyInstance() => create();
  static $pb.PbList<CreateImageResponse> createRepeated() => $pb.PbList<CreateImageResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateImageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateImageResponse>(create);
  static CreateImageResponse? _defaultInstance;

  CreateImageResponse_Response whichResponse() => _CreateImageResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Image get ok => $_getN(0);
  @$pb.TagNumber(1)
  set ok(Image v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => clearField(1);
  @$pb.TagNumber(1)
  Image ensureOk() => $_ensure(0);

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

