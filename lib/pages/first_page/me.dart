import 'package:flutter/material.dart';

class MePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MePageState();
  }
}

class _MePageState extends State<MePage>{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:  new Text('me'),
    );
  }
}