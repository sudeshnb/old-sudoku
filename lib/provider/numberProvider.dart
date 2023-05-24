import 'package:flutter/material.dart';

class NumberProvider with ChangeNotifier {
  int number = 0;

  void setNumber(int no) {
    number = no;
    notifyListeners();
  }
}
