// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data()
    ..count = json['count'] as num
    ..start = json['start'] as num
    ..total = json['total'] as num
    ..title = json['title'] as String
    ..subjects = (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : Details.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'count': instance.count,
      'start': instance.start,
      'total': instance.total,
      'title': instance.title,
      'subjects': instance.subjects
    };
