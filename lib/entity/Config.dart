import 'package:password_manage/utils/Constant.dart';

class Config {
  int id;
  String gesture;
  bool isGesture;
  bool isFingerprint;
  bool isMySQL;
  bool isSQLite;

  Config();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      Gesture: gesture,
      IsGesture: isGesture == true ? 1 : 0,
      IsFingerprint: isFingerprint == true ? 1 : 0,
      IsMySQL: isMySQL == true ? 1 : 0,
      IsSQLite: isSQLite == true ? 1 : 0,
    };
    if (id != null) map[Id] = id;
    return map;
  }

  Config.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    gesture = map[Gesture];
    isGesture = map[IsGesture] == 1;
    isFingerprint = map[IsFingerprint] == 1;
    isMySQL = map[IsMySQL] == 1;
    isSQLite = map[IsSQLite] == 1;
  }
}
