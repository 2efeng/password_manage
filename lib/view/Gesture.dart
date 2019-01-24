import 'package:flutter/material.dart';
import 'package:gesture_password/gesture_password.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        key: scaffoldState,
        appBar: new AppBar(
          title: new Text('手势密码'),
        ),
        body: new Column(
          children: <Widget>[
            new Center(
              child: new Text("请输入手势密码", style: TextStyle(fontSize: 18.0)),
            ),
            new Center(
              child: new GesturePassword(
                height: 350.0,
                width: 350.0,
                attribute: ItemAttribute(
                    normalColor: Colors.grey, selectedColor: Colors.blueGrey),
                successCallback: (s) {
//                  print("password : $s");
                },
                failCallback: () {
//                  print('fail');
                },
                selectedCallback: (str) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
