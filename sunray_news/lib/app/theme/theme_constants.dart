import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color.fromRGBO(27, 69, 113, 1),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(27, 69, 113, 1),
    selectedIconTheme: IconThemeData(color: Color.fromRGBO(27, 69, 113, 1)),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromRGBO(27, 69, 113, 1),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: Color.fromRGBO(27, 69, 113, 1)),
  ),
);
