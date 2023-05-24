import 'package:flutter/material.dart';
import 'package:sudoku02/provider/level/level_Preference.dart';

class LevelProvider extends ChangeNotifier {
  LevelPreference levelPre = LevelPreference();

  int _level = 57;

  int get getLevel => _level;

  set getLevel(int value) {
    _level = value;
    levelPre.setLevel(value);
    notifyListeners();
  }
}
