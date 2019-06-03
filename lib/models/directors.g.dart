// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Directors _$DirectorsFromJson(Map<String, dynamic> json) {
  return Directors()
    ..avatars = json['avatars'] == null
        ? null
        : Image.fromJson(json['avatars'] as Map<String, dynamic>)
    ..name_en = json['name_en'] as String
    ..name = json['name'] as String
    ..alt = json['alt'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$DirectorsToJson(Directors instance) => <String, dynamic>{
      'avatars': instance.avatars,
      'name_en': instance.name_en,
      'name': instance.name,
      'alt': instance.alt,
      'id': instance.id
    };
