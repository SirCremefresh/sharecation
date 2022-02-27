import 'package:json_annotation/json_annotation.dart';

part 'generated_jwt.g.dart';

@JsonSerializable()
class GeneratedJwt {
  GeneratedJwt({
    required this.jwtString,
    required this.payload,
  });

  String jwtString;

  GeneratedJwtPayload payload;

  factory GeneratedJwt.fromJson(Map<String, dynamic> json) =>
      _$GeneratedJwtFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratedJwtToJson(this);
}

@JsonSerializable()
class GeneratedJwtPayload {
  String sub;
  int exp;
  List<String> rights;

  GeneratedJwtPayload(
      {required this.sub, required this.exp, required this.rights});

  factory GeneratedJwtPayload.fromJson(Map<String, dynamic> json) =>
      _$GeneratedJwtPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratedJwtPayloadToJson(this);
}
