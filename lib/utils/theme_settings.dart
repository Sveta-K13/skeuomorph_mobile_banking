import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  static const _kDarkMode = 'DARK_MODE';

  final SharedPreferences _prefs;

  ThemeSettings(this._prefs);

  bool get isDarkMode => _prefs.getBool(_kDarkMode) ?? false;

  void setTheme(bool val) {
    _prefs?.setBool(_kDarkMode, val);
    notifyListeners();
  }
}
