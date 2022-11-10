import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool isDark = false;

  ThemeMode currentTheme() => isDark ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
