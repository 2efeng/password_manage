import 'package:flutter/material.dart';

class AddGroup extends StatefulWidget {
  AddGroup({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddGroupPageState createState() => new _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Group"),
      ),
      body: Center(child: Text("Add Group")),
    );
  }
}
