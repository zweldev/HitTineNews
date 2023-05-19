import 'package:flutter/material.dart';

class ThemeManager {
  ThemeManager._();
  static ThemeManager instance = ThemeManager._();

  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  ThemeMode toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    return _themeMode;
  }
}
