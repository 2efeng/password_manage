import 'package:flutter/material.dart';
import 'package:password_manage/entity/PasswordNode.dart';
import 'package:password_manage/view/AddPassword.dart';

class Password extends StatefulWidget {
  Password({Key key}) : super(key: key);

  @override
  _PasswordPageState createState() => new _PasswordPageState();
}

class _PasswordPageState extends State<Password> {
  List<PasswordNode> pwdItems = <PasswordNode>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password"),
      ),
      body: new Scrollbar(
        child: new ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: pwdItems.length,
            itemBuilder: (BuildContext _context, int index) {
              return _buildRow(index);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("add password"),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new AddPassword()),
          );
        },
      ),
    );
  }

  Widget _buildRow(int item) {
    return new Column(
      children: <Widget>[buildListData(context, pwdItems[item]), new Divider()],
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
