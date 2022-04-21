import 'package:esnya/presentation/core/design_components/esnya_text_styles.dart';
import 'package:flutter/material.dart';

import 'esnya_colors.dart';

final themeDataLight = ThemeData(
  fontFamily: 'CircularStd',
  primaryColor: colorSchemeLight.primary,
  primarySwatch: Colors.green,
  backgroundColor: colorSchemeLight.background,
  shadowColor: colorSchemeLight.shadow,
  colorScheme: colorSchemeLight,
  textTheme: esnyaTextThemeLight,
);

// utils:

ColorScheme getColorTheme(BuildContext context) =>
    Theme.of(context).colorScheme;

TextTheme getTextTheme(BuildContext context) => Theme.of(context).textTheme;

typedef GetColor = Color Function(ColorScheme c);
typedef GetTextStyle = TextStyle? Function(TextTheme t);
