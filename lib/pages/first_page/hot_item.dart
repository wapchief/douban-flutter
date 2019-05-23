import 'package:flutter/material.dart';
import 'dart:core';

class HotViewItem extends StatelessWidget {

  final String cover;
  final String title;
  final String rating;
  const HotViewItem({Key key,this.cover,this.title,this.rating,}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: new Column(
          children: <Widget>[
            new Image(
              image: new NetworkImage(cover),
              width: 200,
              height: 266,
            ),
            new Text(
              title,
              style: new TextStyle(
                color: const Color(0x333333),
                fontSize: 32,
              ),
              softWrap: false,//超出是否换行
              maxLines:1,//显示行数
            )
          ],    
      ),
    );
  }
}