import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
import 'package:douban_flutter/utils/LogUtils.dart';
import 'dart:convert';
import 'package:douban_flutter/models/data.dart';
import 'package:douban_flutter/models/details.dart';
import 'package:douban_flutter/utils/NetUtils.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HotPageState();
  }
}

class _HotPageState extends State<HotPage> {
  List<Details> subjects = [];

//  double itemW;

  @override
  Widget build(BuildContext context) {
//    itemW = MediaQuery.of(context).size.width / 4;
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.52, //子组件比例
          mainAxisSpacing: 10.0, //纵向间隔
          crossAxisSpacing: 10.0, //横向间隔
        ),
        itemCount: subjects.length,
        itemBuilder: (BuildContext context, int index) {
          Details bean = subjects[index];
          return Container(
            child: _getGridItem(bean),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getHotList();
  }

  //获取列表
  _getHotList() async {
    String hotURL = "http://douban.uieee.com/v2/movie/in_theaters";
    try {
      var response = await NetUtils.get(hotURL, params: {});
      var u = Data.fromJson(response);
      print(u.subjects[0].title);
      //更新view
      setState(() {
        subjects = u.subjects;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  _getGridItem(Details bean) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Image.network(
              bean.images.large,
              fit: BoxFit.cover,
              height: 146.0,
            ),
          ),
          Text(
            bean.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Rating(bean.rating.average.toDouble())
        ],
      ),
    );
  }
}

class Rating extends StatelessWidget {
  double rating;

  Rating(this.rating);

  Icon starMax = Icon(
    Icons.star,
    size: 13.0,
    color: Colors.orange,
  );
  Icon starNone = Icon(
    Icons.star_border,
    size: 13.0,
  );
  Icon starhalf = Icon(
    Icons.star_half,
    size: 13.0,
    color: Colors.orange,
  );
  List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    widgets = [];
    if (rating / 2 < 0.5) {
      //0星
      widgets = [starNone, starNone, starNone, starNone, starNone];
    } else if (rating / 2 >= 0.5 && rating / 2 < 1) {
      //0.5
      widgets = [starhalf, starNone, starNone, starNone, starNone];
    } else if (rating / 2 >= 1 && rating / 2 < 1.5) {
      //1
      widgets = [starMax, starNone, starNone, starNone, starNone];
    } else if (rating / 2 >= 1.5 && rating / 2 < 2) {
      //1.5
      widgets = [starMax, starhalf, starNone, starNone, starNone];
    } else if (rating / 2 >= 2 && rating / 2 < 2.5) {
      //2
      widgets = [starMax, starMax, starNone, starNone, starNone];
    } else if (rating / 2 >= 2.5 && rating / 2 < 3) {
      //2.5
      widgets = [starMax, starMax, starhalf, starNone, starNone];
    } else if (rating / 2 >= 3 && rating / 2 < 3.5) {
      //3
      widgets = [starMax, starMax, starMax, starNone, starNone];
    } else if (rating / 2 >= 3.5 && rating / 2 < 4) {
      //3.5
      widgets = [starMax, starMax, starMax, starhalf, starNone];
    } else if (rating / 2 >= 4 && rating / 2 < 4.5) {
      //4
      widgets = [starMax, starMax, starMax, starMax, starNone];
    } else if (rating / 2 >= 4.5 && rating / 2 < 5) {
      //4.5
      widgets = [starMax, starMax, starMax, starMax, starhalf];
    } else {
      widgets = [starMax, starMax, starMax, starMax, starMax];
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: widgets,
        ),
        Text(
          (rating).toString(),
          style: TextStyle(fontSize: 13.0),
        )
      ],
    );
  }
}
