import 'package:flutter/material.dart';

class AppColors {
  static const orange = MaterialColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Color(0xFFFAF8F6),
      100: Color(0xFFFEEADD),
      200: Color(0xFFFFD0B0),
      300: Color(0xFFFFCDAB),
      400: Color(0xFFFAD880),
      500: Color(_orangePrimaryValue),
      600: Color(0xFFD65A14),
      700: Color(0xFFC7580D),
      800: Color(0xFF956E53),
      900: Color(0xFF5C2408),
    },
  );
  static const _orangePrimaryValue = 0xFFFD6921;

  static const black = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFFF1F1F2),
      100: Color(0xFFE6E6E6),
      200: Color(0xFF98989C),
      300: Color(0xFF87878C), // text
      400: Color(0xFF626165),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF292D32),
      700: Color(0xFF0B0B0B),
      800: Color(0xFF080808),
      900: Color(0xFF050505),
    },
  );
  static const _blackPrimaryValue = 0xFF121212;

  static const red = Color(0xFFED0000);
  static const green = Color(0xFF3BA55C);
  static const darkGreen = Color(0xFF1A2826);
  static const white = Color(0xFFFFFFFF);
  static const yellow = Color(0xFFCB9E2B);

  // shadow
  static const shadow = Color.fromRGBO(0, 0, 0, 0.1);
  // glossy color
  static const glossy = Color.fromRGBO(255, 255, 255, 0.2);

  // Border color
  static const border = Color.fromRGBO(98, 97, 101, 0.19);
  static const borderLight = Color.fromRGBO(255, 255, 255, 0.7);
  static const fontColor = Color(0xFF1C1D21);
}
