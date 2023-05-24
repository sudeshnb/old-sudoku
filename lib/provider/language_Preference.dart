import 'package:shared_preferences/shared_preferences.dart';

class LanguagePreference {
  static const Language_STATUS = "LANGUAGESTATUS";

  setLanguage(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Language_STATUS, value);
  }

  Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Language_STATUS) ?? 'en';
  }
}
