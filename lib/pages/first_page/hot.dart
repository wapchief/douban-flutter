import 'package:flutter/material.dart';

class HotPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HotPageState();
  }
}

class _HotPageState extends State<HotPage>{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:  new Text('hot'),
    );
  }
}