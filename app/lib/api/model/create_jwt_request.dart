import 'package:json_annotation/json_annotation.dart';

part 'create_jwt_request.g.dart';


@JsonSerializable()
class CreateJwtRequest {
  CreateJwtRequest({
    required this.jwtString,
  });

  String jwtString;

  factory CreateJwtRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateJwtRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateJwtRequestToJson(this);
}
