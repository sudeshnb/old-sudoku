import 'package:flutter/material.dart';
import 'package:sudoku02/provider/language_Preference.dart';

class LocaleProvider extends ChangeNotifier {
  LanguagePreference languagePreference = LanguagePreference();

  String _language = 'en';

  String get getLanguages => _language;

  set getLanguages(String value) {
    _language = value;
    languagePreference.setLanguage(value);
    notifyListeners();
  }
}

class Language {
  static Locale localeData(String isLocale) {
    return Locale(isLocale);
  }
}
