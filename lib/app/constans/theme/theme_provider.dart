import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  // initially, lightMode
  ThemeData _themeData = lightMode;

  // getter method to access the theme from oter parts of the code
  ThemeData get themeData => _themeData;

  //getter method to see if we are in dark mode or not
  bool get isDarkMode => _themeData == darkMode;

  // setter method to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // toggle to switch theme data

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
