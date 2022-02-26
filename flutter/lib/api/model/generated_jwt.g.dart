// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_jwt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedJwt _$GeneratedJwtFromJson(Map<String, dynamic> json) => GeneratedJwt(
      jwtString: json['jwtString'] as String,
      payload:
          GeneratedJwtPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneratedJwtToJson(GeneratedJwt instance) =>
    <String, dynamic>{
      'jwtString': instance.jwtString,
      'payload': instance.payload,
    };

GeneratedJwtPayload _$GeneratedJwtPayloadFromJson(Map<String, dynamic> json) =>
    GeneratedJwtPayload(
      sub: json['sub'] as String,
      exp: json['exp'] as int,
      rights:
          (json['rights'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GeneratedJwtPayloadToJson(
        GeneratedJwtPayload instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'exp': instance.exp,
      'rights': instance.rights,
    };
