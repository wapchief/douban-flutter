import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
    Image();

    String small;
    String large;
    String medium;
    
    factory Image.fromJson(Map<String,dynamic> json) => _$ImageFromJson(json);
    Map<String, dynamic> toJson() => _$ImageToJson(this);
}
