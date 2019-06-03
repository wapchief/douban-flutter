import 'package:flutter/material.dart';
import 'dart:convert';

class Top250Page extends StatefulWidget{
  Top250Page({Key key}) : super(key: key);

  @override
  _TopPageState createState() => new _TopPageState();
}

class _TopPageState extends State<Top250Page>{

  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[i]["title"]}")
    );
  }

  loadData() async {

  }
}
