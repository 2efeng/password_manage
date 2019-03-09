import 'package:flutter/material.dart';

class AddPassword extends StatefulWidget {
  AddPassword({Key key}) : super(key: key);

  @override
  _AddPasswordPageState createState() => new _AddPasswordPageState();
}

class _AddPasswordPageState extends State<AddPassword> {
  TextEditingController _title = new TextEditingController();
  TextEditingController _username = new TextEditingController();
  TextEditingController _userpwd = new TextEditingController();
  TextEditingController _description = new TextEditingController();

  void handleSubmitNewMarker() {
    String title = _title.text;
    String username = _username.text;
    String userpwd = _userpwd.text;
    String description = _description.text;
    setState(() {});

    _title.clear();
    _username.clear();
    _userpwd.clear();
    _description.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Password Info"),
      ),
      body: new Container(
          child: new Column(children: <Widget>[
        new Container(
          margin: new EdgeInsets.symmetric(horizontal: 45.0, vertical: 45.0),
          child: new Column(
            children: <Widget>[
              new TextField(
                  controller: _title,
                  decoration: const InputDecoration(
                    labelText: 'title',
                  )),
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: new TextField(
                    controller: _username,
                    decoration: const InputDecoration(
                      labelText: 'username',
                    )),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: new TextField(
                    controller: _userpwd,
                    decoration: const InputDecoration(
                      labelText: 'password',
                    )),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: new TextField(
                    controller: _description,
                    decoration: const InputDecoration(
                      labelText: 'description',
                    )),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 25.0),
                child: new RaisedButton(
                  onPressed: handleSubmitNewMarker,
                  child: new Text('Add'),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
