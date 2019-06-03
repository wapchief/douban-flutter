import 'package:json_annotation/json_annotation.dart';

part 'item_top250.g.dart';

@JsonSerializable()
  class Top250{
  int count;
  int start;
  int total;
  List<ItemTop250> subjects;

  Top250(this.count, this.start, this.total, this.subjects);

}



class ItemTop250{
  String title;//标题
  Rating rating;//评分
  List<String> genres;//类型
  List<String> durations;//片长
  List<String> pubdates;//上映时间
  String mainland_pubdate;//大陆上映时间
  ImagesBean images;//封面
}

class Rating{
  int max;//最大值
  int average;//当前评分
//  String stars;//评星数
//  int min;//最小值
}

class ImagesBean{
  String small;
  String large;
  String medium;
}