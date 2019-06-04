import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:douban_flutter/utils/LogUtils.dart';
import 'dart:convert';
import 'package:douban_flutter/utils/NetUtils.dart';
import 'package:douban_flutter/models/data.dart';
class HotPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HotPageState();
  }
}

class _HotPageState extends State<HotPage>{
  List<Widget> widgets = [ Text("0000000"), Text("11111111")];
  String str="1111111";
  TextStyle mStyleTilte= TextStyle(fontSize: 40.0,color:Color(0xff83cbe6));
  Text mText = Text('哈哈哈哈哈');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body:  new ListView(children: widgets,),
      body: Container(
        child: Column(
          children:[
            Text("Column-纵向布局"),
            Column(children:<Widget> [Text('11111',style: mStyleTilte,),Text('22222')],),
            Text("Row-横向布局"),
            Row(children: <Widget>[Text("1111"),Text("2222")],),
            Text("Stack-重叠布局"),
            Stack(children: <Widget>[mText,Text("2222")],)
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
      var u = Data.fromJson(response);
      print(u);
      print(u.subjects[0].title);
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