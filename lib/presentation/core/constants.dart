import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData.light().copyWith(
  primaryColor: Colors.green[800],
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

const String kAppName = "Esnya Food Tracker";
