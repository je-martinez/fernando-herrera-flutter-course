import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colorList.length,
            "Invalid color index");

  ThemeData getTheme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(centerTitle: false));
  }
}
