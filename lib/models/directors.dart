import 'package:json_annotation/json_annotation.dart';
import "image.dart";
part 'directors.g.dart';

@JsonSerializable()
class Directors {
    Directors();

    Image avatars;
    String name_en;
    String name;
    String alt;
    String id;
    
    factory Directors.fromJson(Map<String,dynamic> json) => _$DirectorsFromJson(json);
    Map<String, dynamic> toJson() => _$DirectorsToJson(this);
}
