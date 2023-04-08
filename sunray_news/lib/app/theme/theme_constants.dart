import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.white,
    secondary: Color.fromRGBO(27, 69, 113, 1),
    onSecondary: Color.fromRGBO(27, 69, 113, 1),
    error: Colors.red,
    onError: Colors.red,
    background: Colors.grey,
    onBackground: Colors.white,
    surface: Colors.black,
    onSurface: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromRGBO(27, 69, 113, 1),
    onPrimary: Color.fromRGBO(27, 69, 113, 1),
    secondary: Colors.white,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    background: Colors.grey,
    onBackground: Colors.black,
    surface: Colors.black,
    onSurface: Colors.black,
  ),
);
