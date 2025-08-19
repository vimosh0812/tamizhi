import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static lightTheme() => ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.orange,
        colorScheme: const ColorScheme.light(
          primary: AppColors.orange,
        ),
        // scaffoldBackgroundColor: Colors.white,
        fontFamily: "DMSans",
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: "DMSans",
            color: AppColors.darkGreen,
          ),
        ),
      );
}
