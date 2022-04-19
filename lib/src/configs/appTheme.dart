import 'package:flutter/material.dart';

import 'appColors.dart';

 

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor:scaffoldColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: black,
        size: 30,
      ),
      backgroundColor: white,
      elevation: 0,
    ),
  );
}
