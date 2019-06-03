// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Casts _$CastsFromJson(Map<String, dynamic> json) {
  return Casts()
    ..avatars = json['avatars'] == null
        ? null
        : Image.fromJson(json['avatars'] as Map<String, dynamic>)
    ..name_en = json['name_en'] as String
    ..name = json['name'] as String
    ..alt = json['alt'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$CastsToJson(Casts instance) => <String, dynamic>{
      'avatars': instance.avatars,
      'name_en': instance.name_en,
      'name': instance.name,
      'alt': instance.alt,
      'id': instance.id
    };
