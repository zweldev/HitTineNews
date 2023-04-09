import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 15)),
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
  useMaterial3: true,
  textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 15)),
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
