
import 'dart:math' as math;
import 'package:douban_flutter/bean/subject_entity.dart';
class TopItemBean {
  var count; //共多少部
  var imgUrl; //图片url
  List<Item> items; //多少个电影
  TopItemBean(this.count, this.imgUrl, this.items);

  ///将Top250数据转换成榜单item对应的数据类型
  static TopItemBean convertTopBeans(List<Subject> hotBeans) {
    var count = '豆瓣榜单 · 共250部';
    var imgUrl = hotBeans[0].images.large;
    int itemCount = math.min(4, hotBeans.length);
    hotBeans = hotBeans.sublist(0, itemCount);
    List<Item> items = [];
    for(Subject bean in hotBeans){
      items.add(Item(bean.title, bean.rating.average, true));
    }
    return TopItemBean(count, imgUrl, items);
  }

}

class Item {
  var title; //电影名称
  var average; //评分
  bool upOrDown; //热度上升还是下降

  Item(this.title, this.average, this.upOrDown);
}