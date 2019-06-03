import 'package:json_annotation/json_annotation.dart';
import "details.dart";
part 'data.g.dart';

@JsonSerializable()
class Data {
    Data();

    num count;
    num start;
    num total;
    String title;
    List<Details> subjects;
    
    factory Data.fromJson(Map<String,dynamic> json) => _$DataFromJson(json);
    Map<String, dynamic> toJson() => _$DataToJson(this);
}
