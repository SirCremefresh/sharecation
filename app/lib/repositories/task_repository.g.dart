// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskConfigImageUpload _$$TaskConfigImageUploadFromJson(
        Map<String, dynamic> json) =>
    _$TaskConfigImageUpload(
      externalId: json['externalId'] as String,
      groupId: json['groupId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$TaskConfigImageUploadToJson(
        _$TaskConfigImageUpload instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'groupId': instance.groupId,
      'type': instance.$type,
    };

_$TaskConfigCreateImage _$$TaskConfigCreateImageFromJson(
        Map<String, dynamic> json) =>
    _$TaskConfigCreateImage(
      groupId: json['groupId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$TaskConfigCreateImageToJson(
        _$TaskConfigCreateImage instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'type': instance.$type,
    };
