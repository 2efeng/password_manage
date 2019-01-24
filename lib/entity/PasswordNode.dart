import 'package:intl/intl.dart';
import 'package:password_manage/utils/Constant.dart';

var format = new DateFormat('yyyy-MM-dd HH:mm:ss.SSS');

class PasswordNode {
  int id;
  int parent;
  bool type; //true/1->group false/0->password
  String title;
  String username;
  String userpwd;
  String description;
  bool isStick;
  DateTime stickTime;
  DateTime createOn;
  DateTime updateOn;

  PasswordNode();

  Iterable toArr() {
    return [
      parent,
      type,
      title,
      username,
      userpwd,
      description,
      isStick,
      stickTime,
      createOn,
      updateOn
    ];
  }

  PasswordNode.fromMapString(Map<String, dynamic> row) {
    id = row[columnId];
    parent = row[columnParent];
    type = row[columnType] == 1;
    title = row[columnName];
    username = row[columnUsername];
    userpwd = row[columnPassword];
    description = row[columnDescription];
    isStick = row[columnIsStick] == 1;
    stickTime = format.parse(row[columnStickTime].toString());
    createOn = format.parse(row[columnCreate].toString());
    updateOn = format.parse(row[columnUpdate].toString());
  }

  PasswordNode.fromMap(Map<int, dynamic> row) {
    id = row[0];
    parent = row[1];
    type = row[2] == 1;
    title = row[3];
    username = row[4];
    userpwd = row[5];
    description = row[6];
    isStick = row[7] == 1;
    stickTime = format.parse(row[8].toString());
    createOn = format.parse(row[9].toString());
    updateOn = format.parse(row[10].toString());
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnParent: parent,
      columnType: type == true ? 1 : 0,
      columnName: title,
      columnUsername: username,
      columnPassword: userpwd,
      columnDescription: description,
      columnIsStick: isStick == true ? 1 : 0,
      columnStickTime: stickTime,
      columnCreate: createOn,
      columnUpdate: updateOn
    };
    if (id != null) map[columnId] = id;
    return map;
  }
}
