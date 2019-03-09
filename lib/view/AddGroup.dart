import 'package:flutter/material.dart';

class AddGroup extends StatefulWidget {
  AddGroup({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddGroupPageState createState() => new _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroup> {
  TextEditingController _title = new TextEditingController();
  TextEditingController _description = new TextEditingController();

  void handleSubmitNewMarker() {
    String title = _title.text;
    String description = _description.text;
    setState(() {});
    _title.clear();
    _description.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Group"),
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
