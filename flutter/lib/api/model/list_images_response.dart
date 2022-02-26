import 'package:json_annotation/json_annotation.dart';

part 'list_images_response.g.dart';

@JsonSerializable()
class ListImagesResponse {
  ListImagesResponse({required this.images});

  List<ListImagesResponseImages> images;

  factory ListImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListImagesResponseToJson(this);
}

@JsonSerializable()
class ListImagesResponseImages {
  ListImagesResponseImages({required this.id, required this.name});

  String id;
  String name;

  factory ListImagesResponseImages.fromJson(Map<String, dynamic> json) =>
      _$ListImagesResponseImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ListImagesResponseImagesToJson(this);
}
