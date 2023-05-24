import 'package:shared_preferences/shared_preferences.dart';

class LevelPreference {
  static const LEVEL_STATUS = "counter";

  setLevel(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(LEVEL_STATUS, value);
  }

  Future<int> getLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(LEVEL_STATUS) ?? 0;
  }
}
