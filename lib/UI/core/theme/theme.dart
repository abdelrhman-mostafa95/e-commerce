import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData myTheme = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF004182),
          selectedIconTheme: IconThemeData(color: Colors.white),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ));
}
