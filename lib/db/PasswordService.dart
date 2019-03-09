import 'dart:async';
import 'package:password_manage/entity/PasswordNode.dart';
import "package:sqljocky5/sqljocky.dart";
import 'package:password_manage/utils/Constant.dart';

ConnectionSettings config() {
  var settings = ConnectionSettings(
    user: dbUser,
    password: dbPwd,
    host: dbHost,
    port: dbPort,
    db: dbName,
  );
  return settings;
}

Future<void> createTables() async {
  var conn = await MySqlConnection.connect(config());
  var sql = 'CREATE TABLE $tableName ('
      '$columnId INTEGER NOT NULL AUTO_INCREMENT, '
      '$columnParent INTEGER NOT NULL, '
      '$columnType TINYINT NOT NULL, '
      '$columnName VARCHAR(100) NOT NULL, '
      '$columnUsername VARCHAR(200),'
      '$columnPassword VARCHAR(200),'
      '$columnDescription VARCHAR(200),'
      '$columnIsStick TINYINT NOT NULL,'
      '$columnStickTime DATETIME ,'
      '$columnCreate DATETIME NOT NULL,'
      '$columnUpdate DATETIME NOT NULL,'
      'PRIMARY KEY ($columnId))';
  await conn.execute("DROP TABLE IF EXISTS $tableName");
  await conn.execute(sql);
  await conn.close();
}

Future<void> insertPwd(PasswordNode pwd) async {
  var conn = await MySqlConnection.connect(config());
  await conn.preparedMulti(
      "INSERT INTO $tableName ($columnParent, $columnType,$columnName,$columnUsername,$columnPassword,"
      "$columnDescription,$columnIsStick,$columnStickTime,$columnCreate,$columnUpdate) "
      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [pwd.toArr()]);
  await conn.close();
}

Future<List<PasswordNode>> getAll() async {
  var conn = await MySqlConnection.connect(config());
  List<PasswordNode> pwdList = List();
  var sql = 'SELECT $columnId,$columnParent,$columnType,$columnName,'
      '$columnUsername,$columnPassword,$columnDescription,$columnIsStick, '
      '$columnStickTime,$columnCreate,$columnUpdate FROM $tableName';
  await conn.execute(sql).then((results) {
    results.forEach((row) {
      pwdList.add(PasswordNode.fromMap(row.asMap()));
    });
  });
  await conn.close();
  return pwdList;
}

Future<PasswordNode> getPasswordById(int id) async {
  var conn = await MySqlConnection.connect(config());
  var sql = 'SELECT $columnId,$columnParent,$columnType,$columnName,'
      '$columnUsername,$columnPassword,$columnDescription,$columnIsStick, '
      '$columnStickTime,$columnCreate,$columnUpdate FROM $tableName'
      'WHERE $columnId = $id';
  var result = await conn.execute(sql);
  await conn.close();
  return PasswordNode.fromMap(result.first.asMap());
}

Future<List<PasswordNode>> getPasswords(Map<String, dynamic> params) async {
  var conn = await MySqlConnection.connect(config());
  List<PasswordNode> pwdList = List();
  var sql = 'SELECT $columnId,$columnParent,$columnType,$columnName,'
      '$columnUsername,$columnPassword,$columnDescription,$columnIsStick,'
      '$columnStickTime,$columnCreate,$columnUpdate FROM $tableName WHERE';
  StringBuffer buffer = StringBuffer(sql);
  params.forEach((key, value) {
    buffer.write("$key = $value ,");
  });
  buffer.write("0=0");
  await conn.execute(buffer.toString()).then((results) {
    results.forEach((row) {
      pwdList.add(PasswordNode.fromMap(row.asMap()));
    });
  });
  await conn.close();
  return pwdList;
}

Future<void> deletePwd(int id) async {
  var conn = await MySqlConnection.connect(config());
  var sql = 'DELETE FROM $tableName WHERE $columnId = $id';
  await conn.execute(sql).then((result) {
    print(result);
  });
  await conn.close();
}

Future<void> deletePwds(List<int> ids) async {
  var conn = await MySqlConnection.connect(config());
  var sql = "DELETE FROM $tableName WHERE $columnId IN (";
  StringBuffer buffer = StringBuffer(sql);
  for (int id in ids) buffer.write(id.toString() + ",");
  buffer.write("0)");
  print(buffer.toString());
  await conn.execute(buffer.toString()).then((result) {
    print(result);
  });
  await conn.close();
}

Future<void> updatePwd(PasswordNode pwd) async {
  var conn = await MySqlConnection.connect(config());
  var sql = "UPDATE $tableName SET"
      "$columnName = ${pwd.title} ,$columnUsername = ${pwd.username},"
      "$columnPassword = ${pwd.userpwd},$columnUpdate = ${pwd.updateOn},"
      "$columnDescription = ${pwd.description}"
      "WHERE $columnId = ${pwd.id}";
  await conn.execute(sql);
  await conn.close();
}

Future<void> updateGroup(PasswordNode pwd) async {
  var conn = await MySqlConnection.connect(config());
  var sql = "UPDATE $tableName SET "
      "$columnName = ${pwd.title},$columnUpdate =${pwd.updateOn}"
      "WHERE $columnId = ${pwd.id}";
  await conn.execute(sql);
  await conn.close();
}



