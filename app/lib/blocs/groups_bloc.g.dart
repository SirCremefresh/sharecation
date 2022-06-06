// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SharecationImageLocal _$$_SharecationImageLocalFromJson(
        Map<String, dynamic> json) =>
    _$_SharecationImageLocal(
      externalId: json['externalId'] as String,
      path: json['path'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_SharecationImageLocalToJson(
        _$_SharecationImageLocal instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'path': instance.path,
      'type': instance.$type,
    };

_$_SharecationImageRemote _$$_SharecationImageRemoteFromJson(
        Map<String, dynamic> json) =>
    _$_SharecationImageRemote(
      externalId: json['externalId'] as String,
      imageId: json['imageId'] as String,
      url: json['url'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_SharecationImageRemoteToJson(
        _$_SharecationImageRemote instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'imageId': instance.imageId,
      'url': instance.url,
      'type': instance.$type,
    };

_$_SharecationImageSynced _$$_SharecationImageSyncedFromJson(
        Map<String, dynamic> json) =>
    _$_SharecationImageSynced(
      externalId: json['externalId'] as String,
      imageId: json['imageId'] as String,
      url: json['url'] as String,
      path: json['path'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_SharecationImageSyncedToJson(
        _$_SharecationImageSynced instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'imageId': instance.imageId,
      'url': instance.url,
      'path': instance.path,
      'type': instance.$type,
    };

_$_SharecationGroup _$$_SharecationGroupFromJson(Map<String, dynamic> json) =>
    _$_SharecationGroup(
      groupId: json['groupId'] as String,
      name: json['name'] as String,
      images: (json['images'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, SharecationImage.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_SharecationGroupToJson(_$_SharecationGroup instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'name': instance.name,
      'images': instance.images,
    };

_$_SharecationGroups _$$_SharecationGroupsFromJson(Map<String, dynamic> json) =>
    _$_SharecationGroups(
      groups: (json['groups'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, SharecationGroup.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_SharecationGroupsToJson(
        _$_SharecationGroups instance) =>
    <String, dynamic>{
      'groups': instance.groups,
    };
