import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData.light().copyWith(
  primaryColor: Colors.green[800],
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

const kSupportedLocales = [
  Locale('en', ''),
  Locale('en', 'US'),
  Locale('de', 'DE'),
];

const String kAppName = "Esnya Food Tracker";

class SizeConstants {
  static const kSmall = 8.0;
  static const kMedium = 16.0;
  static const kLarge = 24.0;
}

extension EdgeInsetsX on EdgeInsets {
  static const EdgeInsets allSmall = EdgeInsets.all(SizeConstants.kSmall);
  static const EdgeInsets allMedium = EdgeInsets.all(SizeConstants.kMedium);
  static const EdgeInsets allLarge = EdgeInsets.all(SizeConstants.kLarge);
}

extension SizedBoxX on SizedBox {
  static const hSmall = SizedBox(height: SizeConstants.kSmall);
  static const hMedium = SizedBox(height: SizeConstants.kMedium);
  static const hLarge = SizedBox(height: SizeConstants.kLarge);
  static const wSmall = SizedBox(width: SizeConstants.kSmall);
  static const wMedium = SizedBox(width: SizeConstants.kMedium);
  static const wLarge = SizedBox(width: SizeConstants.kLarge);
}
