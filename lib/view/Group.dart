import 'package:flutter/material.dart';
import 'package:password_manage/view/AddGroup.dart';

class Group extends StatefulWidget {
  Group({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GroupPageState createState() => new _GroupPageState();
}

class _GroupPageState extends State<Group> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.dehaze),
        title: Text("Group"),
      ),
      body: _groupList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "add group",
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new AddGroup()),
          );
        },
      ),
    );
  }

  Widget _groupList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return const Divider();
          }
          return _buildRow("123");
        });
  }

  Widget _buildRow(String content) {
    return new ListTile(
      title: new Text(
        content,
        style: _biggerFont,
      ),
    );
  }
}
