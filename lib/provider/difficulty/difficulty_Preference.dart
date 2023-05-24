import 'package:shared_preferences/shared_preferences.dart';

class DifficultyPreference {
  static const Difficulty_STATUS = "level";

  setDifficulty(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(Difficulty_STATUS, value);
  }

  Future<int> getDifficulty() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(Difficulty_STATUS) ?? 57;
  }
}
