import 'package:json_annotation/json_annotation.dart';
import "rating.dart";
import "casts.dart";
import "directors.dart";
import "image.dart";
part 'details.g.dart';

@JsonSerializable()
class Details {
    Details();

    Rating rating;
    List genres;
    String title;
    List<Casts> casts;
    List durations;
    num collect_count;
    String mainland_pubdate;
    bool has_video;
    String original_title;
    String subtype;
    List<Directors> directors;
    List pubdates;
    String year;
    Image images;
    String alt;
    String id;
    
    factory Details.fromJson(Map<String,dynamic> json) => _$DetailsFromJson(json);
    Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
