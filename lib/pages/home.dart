
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:douban_flutter/pages/first_page/hot.dart';
import 'package:douban_flutter/pages/first_page/me.dart';
import 'package:douban_flutter/pages/first_page/top250.dart';

class AppPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage>{
  String appBarTitle = tabData[0]['text'];
  List<Widget> list = List();
  int _currentIndex = 0;
  static List tabData = [
    {'text': '正在热映', 'icon': Icon(Icons.language)},
    {'text': 'Top250', 'icon': Icon(Icons.extension)},
    {'text': '我的', 'icon': Icon(Icons.favorite)}
  ];
  List<BottomNavigationBarItem> myTabs = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    list
      ..add(HotPage())
      ..add(MePage())
      ..add(Top250Page());
  }

//  void onWidgetTap(WidgetPoint widgetPoint, BuildContext context) {
//    List widgetDemosList = new WidgetDemoList().getDemos();
//    String targetName = widgetPoint.name;
//    String targetRouter = '/category/error/404';
//    widgetDemosList.forEach((item) {
//      if (item.name == targetName) {
//        targetRouter = item.routerName;
//      }
//    });
//  }

//  renderAppBar(BuildContext context,Widget widget,int index) {
//    print('renderAppBar=====>>>>>>${index}');
//    if(index == 0) {
//      return null;
//    }
//    return AppBar(title: );
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title:new Text(tabData[_currentIndex]['text'])),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _ItemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Color(0xFFC91B3A),
      ),
    );
  }

  void _ItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }

}