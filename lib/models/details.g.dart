// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return Details()
    ..rating = json['rating'] == null
        ? null
        : Rating.fromJson(json['rating'] as Map<String, dynamic>)
    ..genres = json['genres'] as List
    ..title = json['title'] as String
    ..casts = (json['casts'] as List)
        ?.map(
            (e) => e == null ? null : Casts.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..durations = json['durations'] as List
    ..collect_count = json['collect_count'] as num
    ..mainland_pubdate = json['mainland_pubdate'] as String
    ..has_video = json['has_video'] as bool
    ..original_title = json['original_title'] as String
    ..subtype = json['subtype'] as String
    ..directors = (json['directors'] as List)
        ?.map((e) =>
            e == null ? null : Directors.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..pubdates = json['pubdates'] as List
    ..year = json['year'] as String
    ..images = json['images'] == null
        ? null
        : Image.fromJson(json['images'] as Map<String, dynamic>)
    ..alt = json['alt'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'rating': instance.rating,
      'genres': instance.genres,
      'title': instance.title,
      'casts': instance.casts,
      'durations': instance.durations,
      'collect_count': instance.collect_count,
      'mainland_pubdate': instance.mainland_pubdate,
      'has_video': instance.has_video,
      'original_title': instance.original_title,
      'subtype': instance.subtype,
      'directors': instance.directors,
      'pubdates': instance.pubdates,
      'year': instance.year,
      'images': instance.images,
      'alt': instance.alt,
      'id': instance.id
    };
