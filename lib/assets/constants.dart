import 'package:flutter/material.dart';

const String appName = "Zeus";

const Map<String, Color> colors = {
  'darkGrey': Color(0xff151515),
  'lessDarkGrey': Color(0xff1b1b1b),
  'zenonGreen': Color(0xff2aff50)
};

ThemeData themeData = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(backgroundColor: colors['darkGrey']),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colors['darkGrey'],
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors['zenonGreen'],
    ),
    inputDecorationTheme: InputDecorationTheme(
        iconColor: colors['zenonGreen'],
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors['zenonGreen']!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        )));
