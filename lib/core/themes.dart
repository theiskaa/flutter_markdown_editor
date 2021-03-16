import 'package:flutter/material.dart';

class Themes {
  static ThemeData get defaultTheme {
    return ThemeData(
      brightness: Brightness.light,
      accentColor: Colors.orange,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
    );
  }
}
