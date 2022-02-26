// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListImagesResponse _$ListImagesResponseFromJson(Map<String, dynamic> json) =>
    ListImagesResponse(
      images: (json['images'] as List<dynamic>)
          .map((e) =>
              ListImagesResponseImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListImagesResponseToJson(ListImagesResponse instance) =>
    <String, dynamic>{
      'images': instance.images,
    };

ListImagesResponseImages _$ListImagesResponseImagesFromJson(
        Map<String, dynamic> json) =>
    ListImagesResponseImages(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ListImagesResponseImagesToJson(
        ListImagesResponseImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
