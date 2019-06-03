import 'package:json_annotation/json_annotation.dart';
import "image.dart";
part 'casts.g.dart';

@JsonSerializable()
class Casts {
    Casts();

    Image avatars;
    String name_en;
    String name;
    String alt;
    String id;
    
    factory Casts.fromJson(Map<String,dynamic> json) => _$CastsFromJson(json);
    Map<String, dynamic> toJson() => _$CastsToJson(this);
}
