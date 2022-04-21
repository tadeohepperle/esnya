import 'package:flutter/material.dart';

class EsnyaColors {
  final Color primary;
  final Color secondary;
  final Color error;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color background;
  final Color surface;
  final Color shadow;

  const EsnyaColors({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.background,
    required this.surface,
    required this.shadow,
  });
}

const esnyaColorsLight = EsnyaColors(
  primary: Color.fromARGB(255, 21, 113, 69),
  secondary: Color.fromARGB(255, 142, 70, 61),
  error: Color.fromARGB(255, 255, 60, 54),
  textPrimary: Color.fromARGB(255, 46, 46, 46),
  textSecondary: Color.fromARGB(255, 140, 140, 140),
  textTertiary: Color.fromARGB(255, 207, 207, 207),
  background: Color.fromARGB(255, 230, 230, 230),
  surface: Color.fromARGB(255, 255, 255, 255),
  shadow: Color.fromARGB(49, 43, 43, 43),
);

final colorSchemeLight = ColorScheme(
  primary: esnyaColorsLight.primary,
  secondary: esnyaColorsLight.secondary,
  background: esnyaColorsLight.background,
  brightness: Brightness.light,
  error: esnyaColorsLight.error,
  onBackground: esnyaColorsLight.textPrimary,
  onError: esnyaColorsLight.background,
  onPrimary: esnyaColorsLight.background,
  onSecondary: esnyaColorsLight.background,
  onSurface: esnyaColorsLight.textPrimary,
  surface: esnyaColorsLight.surface,
);
