// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image()
    ..small = json['small'] as String
    ..large = json['large'] as String
    ..medium = json['medium'] as String;
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
      'medium': instance.medium
    };
