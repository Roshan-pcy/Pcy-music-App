import 'package:flutter/material.dart';
import 'package:pcy_music/theme/dark_mode.dart';
import 'package:pcy_music/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themedata = light_mode;
  ThemeData get getTheme => _themedata;
  void set setTheme(ThemeData themeData) {
    _themedata = themeData;
    notifyListeners();
  }

  bool get isDarkMode => _themedata == dark_Mode;
  void togle_Theme() {
    if (_themedata == dark_Mode) {
      setTheme = light_mode;
    } else {
      setTheme = dark_Mode;
    }
  }
}
