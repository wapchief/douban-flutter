import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:douban_flutter/utils/NetUtils.dart';
import 'package:douban_flutter/models/data.dart';
import 'package:douban_flutter/models/details.dart';
class Top250Page extends StatefulWidget{
  Top250Page({Key key}) : super(key: key);

  @override
  _TopPageState createState() => new _TopPageState();
}

class _TopPageState extends State<Top250Page>{

  List<Widget> widgets = [];
  //数据源
  List<Details> subjects = [];
  String str = "1111111";
  TextStyle mStyleTilte = TextStyle(fontSize: 40.0, color: Color(0xff83cbe6));
  Text mText = Text('哈哈哈哈哈');

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: getListViewContainer(),
//        body: GridView.count(
//      padding: const EdgeInsets.all(8.0),
//      primary: false,
//      mainAxisSpacing: 12.0,
//      // 竖向间距
//      crossAxisCount: 3,
//      // 横向 Item 的个数
//      crossAxisSpacing: 12.0,
//      children: widgets,)
      );
  }

  @override
  void initState() {
    super.initState();
//    LogUtils.e('_getHotList', '_getHotList');

    _getHotList();
  }

  //获取列表
  _getHotList() async {
    String hotURL = "http://douban.uieee.com/v2/movie/in_theaters";

    try {
      var response = await NetUtils.get(hotURL, params: {});
      var u = Data.fromJson(response);
      print(u.subjects[0].title);
//      //渲染数据
//      for (var item in u.subjects) {
//        widgets.add(new Container(
//          child: new Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
////              coverImage(item.images.large),
//              new Text(
//                item.title + '-' + item.rating.average.toString(),
//              ),
//            ],
//          ),
//        ));
//      }
      //更新view
      setState(() {
        widgets = widgets;
        subjects=u.subjects;
      });
    } catch (e) {
      print(e.toString());
    }

//    setState(() {
//      str="2222222";
//      widgets=jsonDecode(response.body).subjects;
//    });

//    LogUtils.e('result==========:', response.body);
  }
  getListViewContainer() {
//    if (subjects.length == 0) {
//      //loading
//      return CupertinoActivityIndicator();
//    }
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        //item 的数量
        itemCount: subjects.length,
        itemBuilder: (BuildContext context, int index) {
          Details bean = subjects[index];
          return GestureDetector(
            //Flutter 手势处理
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  numberWidget(index + 1),
                  getItemContainerView(bean),
                  //下面的灰色分割线
                  Container(
                    height: 10,
                    color: Color.fromARGB(255, 234, 233, 234),
                  )
                ],
              ),
            ),
            onTap: () {
              //监听点击事件
//              Router.push(context, Router.detailPage, bean.id);
            },
          );
        });
  }
}



//肖申克的救赎(1993) View
getTitleView(Details subject) {
//    var title = subject['title'];
//    var year = subject['year'];
  return Container(
    child: Row(
      children: <Widget>[
        Icon(
          Icons.play_circle_outline,
          color: Colors.redAccent,
        ),
        Text(
          subject.title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text('(${subject.year})',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey))
      ],
    ),
  );
}

getItemContainerView(Details subject) {
//    var imgUrl = subject['images']['medium'];
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(5.0),
    child: Row(
      children: <Widget>[
        coverImage(subject.images.medium),
        Expanded(
          child: getMovieInfoView(subject),
          flex: 1,
        )
      ],
    ),
  );
}

getStaring(var stars) {
  return Row(
    children: <Widget>[RatingBar(stars), Text('$stars')],
  );
}

//电影标题，星标评分，演员简介Container
getMovieInfoView(Details subject) {
//    var start = subject['rating']['average'];
  return Container(
    height: 150.0,
    alignment: Alignment.topLeft,
    child: Column(
      children: <Widget>[
        getTitleView(subject),
        RatingBar(subject.rating.average),
//        DescWidget(subject)
      ],
    ),
  );
}

//NO.1 图标
numberWidget(var no) {
  return Container(
    child: Text(
      'No.$no',
      style: TextStyle(color: Color.fromARGB(255, 133, 66, 0)),
    ),
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 201, 129),
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
    margin: EdgeInsets.only(left: 12, top: 10),
  );
}


//圆角图片
coverImage(var imgUrl) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    margin: EdgeInsets.only(left: 8, top: 3, right: 8, bottom: 3),
    height: 120.0,
    width: 90.0,
  );
}

class RatingBar extends StatelessWidget {
  final stars;

  RatingBar(this.stars, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> startList = [];
    //实心星星
    var startNumber = stars ~/ 2;
    //半实心星星
    var startHalf = 0;
    if (stars.toString().contains('.')) {
      int tmp = int.parse((stars.toString().split('.')[1]));
      if (tmp >= 5) {
        startHalf = 1;
      }
    }
    //空心星星
    var startEmpty = 5 - startNumber - startHalf;

    for (var i = 0; i < startNumber; i++) {
      startList.add(Icon(
        Icons.star,
        color: Colors.amberAccent,
        size: 18,
      ));
    }
    if (startHalf > 0) {
      startList.add(Icon(
        Icons.star_half,
        color: Colors.amberAccent,
        size: 18,
      ));
    }
    for (var i = 0; i < startEmpty; i++) {
      startList.add(Icon(
        Icons.star_border,
        color: Colors.grey,
        size: 18,
      ));
    }
    startList.add(Text(
      '$stars',
      style: TextStyle(
        color: Colors.grey,
      ),
    ));
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 5),
      child: Row(
        children: startList,
      ),
    );
  }
}