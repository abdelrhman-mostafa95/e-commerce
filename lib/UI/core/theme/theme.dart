import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData myTheme = ThemeData(
    colorScheme:
    ColorScheme.fromSeed(seedColor: Colors.blue.shade900, primary: Colors.blue.shade900),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

      selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        size: 30,
      ),
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false),);
}
