import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
    Rating();

    num max;
    num average;
    
    factory Rating.fromJson(Map<String,dynamic> json) => _$RatingFromJson(json);
    Map<String, dynamic> toJson() => _$RatingToJson(this);
}
