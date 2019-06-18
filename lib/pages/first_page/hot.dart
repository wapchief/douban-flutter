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
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
//        mainAxisSpacing: 10.0,
//        childAspectRatio: 0.7, //子组件比例
      ),

      itemBuilder: (BuildContext context, int index) {
        Details bean = subjects[index];
        return Container(
          child: _getGridItem(bean),
        );
      },
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Image.network(
          bean.images.large,
          fit: BoxFit.cover,

        )),
        Text(
          bean.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star,
              size: 16.0,
              color: Colors.orange,
            ),
            Icon(
              Icons.star,
              size: 16.0,
            ),
            Icon(
              Icons.star,
              size: 16.0,
            ),
            Icon(
              Icons.star,
              size: 16.0,
            ),
            Icon(
              Icons.star_half,
              size: 16.0,
            ),
            Text(
              bean.rating.average.toString(),
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        )
      ],
    );
  }
}
