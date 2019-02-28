import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  Password({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PasswordPageState createState() => new _PasswordPageState();
}

class _PasswordPageState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password"),
      ),
      body: Center(child: Text("Password")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "add password info",
        onPressed: () {},
      ),
    );
  }
}
