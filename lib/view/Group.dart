import 'package:flutter/material.dart';
import 'package:password_manage/entity/PasswordNode.dart';
import 'package:password_manage/view/AddGroup.dart';
import 'package:password_manage/view/Password.dart';

class Group extends StatefulWidget {
  Group({Key key}) : super(key: key);

  @override
  _GroupPageState createState() => new _GroupPageState();
}

class _GroupPageState extends State<Group> {
  List<PasswordNode> groupItems = <PasswordNode>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.dehaze),
        title: Text("Group"),
      ),
      body: new Scrollbar(
        child: new ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: groupItems.length,
            itemBuilder: (BuildContext _context, int index) {
              return _buildRow(index);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("add group"),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new AddGroup()),
          );
        },
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

          ],
        ),
      ),
    );
  }

  Widget _buildRow(int item) {
    return new Column(
      children: <Widget>[
        buildListData(context, groupItems[item]),
        new Divider()
      ],
    );
  }

  Widget buildListData(BuildContext context, PasswordNode item) {
    return new ListTile(
      isThreeLine: false,
      leading: new Icon(Icons.ac_unit),
      title: new Text(item.title),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new Password()),
        );
      },
    );
  }
}
