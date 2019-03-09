import 'package:flutter/material.dart';
import 'package:password_manage/view/Group.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: new Group(),
    );
  }
}
