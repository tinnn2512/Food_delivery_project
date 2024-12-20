import 'package:flutter/material.dart';
import 'package:food_delivery_project/themes/dark_mode.dart' as dark;
import 'package:food_delivery_project/themes/light_mode.dart' as light;

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = light.lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == dark.darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == light.lightMode) {
      themeData = dark.darkMode;
    } else {
      themeData = light.lightMode;
    }
  }
}
