import 'package:flutter/material.dart';
import 'package:douban_flutter/pages/home.dart';

void main() =>
    runApp(new MyApp(items: new List<String>.generate(100, (i) => "Item $i")));

class MyApp extends StatelessWidget {
  final List<String> items;

  //构造函数
  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
//      home:  AppPage(),
      home: AppMain(),
    );
  }
}

class AppMain extends StatelessWidget {
  //层叠布局、定位布局
  var stack = new Stack(
    children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(
            'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555886490.webp'),
        radius: 50.0,
      ),
      Positioned(top: 10.0, left: 10.0, child: Text('嘎哈哈哈哈哈哈哈哈')),
      Positioned(
        bottom: 10.0,
        right: 10.0,
        child: Text('111111111111111'),
      )
    ],
  );

  //卡片布局
  var card = new Card(
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(
            '标题',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          subtitle: Text('副标题'),
          leading: Icon(Icons.access_alarms),
        ),
        ListTile(
          title: Text(
            '标题',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          subtitle: Text('副标题'),
          leading: Icon(Icons.access_alarms),
        ),
        ListTile(
          title: Text(
            '标题',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          subtitle: Text('副标题'),
          leading: Icon(Icons.access_alarms),
        ),
      ],
    ),
  );

  //网格布局
  var girdView = GridView(
    padding: EdgeInsets.all(10.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      childAspectRatio: 0.7, //缩放比例
    ),
    children: <Widget>[
      GridItem(),
      Image.network(
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555886490.webp',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554525534.webp',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2558701068.webp',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555886490.webp',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555886490.webp',
        fit: BoxFit.cover,
      ),
      Image.network(
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555886490.webp',
        fit: BoxFit.cover,
      ),
      GridItem(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(
            'ListView',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                card,
              ],
            ),
            Column(
              children: <Widget>[
                Text('层叠布局stack'),
                stack,
              ],
            ),
            RaisedButton(
                child: Text('进入首页'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppPage()),
                  );
                })
//                Column(
//                  children: <Widget>[
//                    Text('网格布局GridView'),
//                    girdView,
//                  ],
//                )
          ],
        ));
  }
}

//item
class GridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Image.network(
          'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555886490.webp',
          fit: BoxFit.fill,
        )),
        Text('x战警'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              Icons.star,
              size: 16.0,
            ),
            Icon(
              Icons.star_half,
              size: 16.0,
            ),
            Text(
              '9.0',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        )
      ],
    );
  }
}
