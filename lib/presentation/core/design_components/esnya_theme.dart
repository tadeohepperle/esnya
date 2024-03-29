import 'esnya_text_styles.dart';
import 'package:flutter/material.dart';

import 'esnya_colors.dart';

final themeDataLight = ThemeData(
  fontFamily: '',
  primaryColor: colorSchemeLight.primary,
  primarySwatch: Colors.green,
  backgroundColor: colorSchemeLight.background,
  shadowColor: colorSchemeLight.shadow,
  colorScheme: colorSchemeLight,
  textTheme: esnyaTextThemeLight,
  scaffoldBackgroundColor: colorSchemeLight.background,
  bottomAppBarColor: colorSchemeLight.surface,
);
