import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:douban_flutter/utils/LogUtils.dart';
import 'dart:convert';
import 'package:douban_flutter/utils/NetUtils.dart';
class HotPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HotPageState();
  }
}

class _HotPageState extends State<HotPage>{
  List<Widget> widgets = [new Text("0000000"),new Text("11111111")];
  String str="1111111";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      body:  new ListView(children: widgets,),
      body: new Container(
        decoration: new BoxDecoration(color: Colors.blue),
        child: new Column(
          children:[
            new Text("Column-纵向布局"), 
            new Column(children:<Widget> [new Text('11111'),new Text('22222')],),
            new Text("Row-横向布局"),
            new Row(children: <Widget>[new Text("1111"),new Text("2222")],),
            new Text("Stack-重叠布局"),
            new Stack(children: <Widget>[new Text('1111'),new Text("2222")],)
            ],
        ),
      )

    );
  }

  @override
  void initState(){
    super.initState();
//    LogUtils.e('_getHotList', '_getHotList');

    _getHotList();
  }
  //获取列表
  _getHotList() async{
    String hotURL="http://douban.uieee.com/v2/movie/in_theaters";
//    http.Response response = await http.get(hotURL);
//    print(response.body);
//    Map<String, dynamic> data = json.decode(response.body);
    var responseList = [];
    var  pageTotal = 0;

    try{
      var response=await NetUtils.get(hotURL,params: {});
      print(response);
      responseList = response['subjects'];
      pageTotal = response['total'];
      if (!(pageTotal is int) || pageTotal <= 0) {
        pageTotal = 0;
      }
      print(responseList);
      print(pageTotal);

    }catch(e){
      print(e.toString());

    }

//    setState(() {
//      str="2222222";
//      widgets=jsonDecode(response.body).subjects;
//    });

//    LogUtils.e('result==========:', response.body);
  }
}

class HotData{
//  final String total;

}