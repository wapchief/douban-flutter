import 'package:flutter/material.dart';
class Top250Page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TopPageState();
  }
}

class _TopPageState extends State<Top250Page>{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:  new Text('top250'),
    );
  }
}