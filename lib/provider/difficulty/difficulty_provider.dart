import 'package:flutter/material.dart';
import 'package:sudoku02/provider/difficulty/difficulty_Preference.dart';

class DifficultyProvider extends ChangeNotifier {
  DifficultyPreference difficultyPre = DifficultyPreference();

  late int _difficulty = 57;

  int get getDifficulty => _difficulty;

  set getDifficulty(int value) {
    _difficulty = value;
    difficultyPre.setDifficulty(value);
    notifyListeners();
  }
}
