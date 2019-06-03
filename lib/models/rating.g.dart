// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating()
    ..max = json['max'] as num
    ..average = json['average'] as num;
}

Map<String, dynamic> _$RatingToJson(Rating instance) =>
    <String, dynamic>{'max': instance.max, 'average': instance.average};
