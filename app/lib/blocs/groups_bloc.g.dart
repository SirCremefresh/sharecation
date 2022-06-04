// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SharecationImage _$$_SharecationImageFromJson(Map<String, dynamic> json) =>
    _$_SharecationImage(
      localId: json['localId'] as String,
    );

Map<String, dynamic> _$$_SharecationImageToJson(_$_SharecationImage instance) =>
    <String, dynamic>{
      'localId': instance.localId,
    };

_$_SharecationGroup _$$_SharecationGroupFromJson(Map<String, dynamic> json) =>
    _$_SharecationGroup(
      images: (json['images'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, SharecationImage.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_SharecationGroupToJson(_$_SharecationGroup instance) =>
    <String, dynamic>{
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
