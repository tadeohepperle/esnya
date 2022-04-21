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

const kEsnyaColorsLight = EsnyaColors(
  primary: Color.fromARGB(255, 21, 113, 69),
  secondary: Color.fromARGB(255, 142, 70, 61),
  error: Color.fromARGB(255, 255, 60, 54),
  textPrimary: Color.fromARGB(255, 46, 46, 46),
  textSecondary: Color.fromARGB(255, 176, 176, 176),
  textTertiary: Color.fromARGB(255, 207, 207, 207),
  background: Color.fromARGB(255, 241, 241, 241),
  surface: Color.fromARGB(255, 255, 255, 255),
  shadow: Color.fromRGBO(40, 49, 47, 0.149),
);

final colorSchemeLight = ColorScheme(
  primary: kEsnyaColorsLight.primary,
  secondary: kEsnyaColorsLight.secondary,
  background: kEsnyaColorsLight.background,
  brightness: Brightness.light,
  error: kEsnyaColorsLight.error,
  onBackground: kEsnyaColorsLight.textPrimary,
  onError: kEsnyaColorsLight.background,
  onPrimary: kEsnyaColorsLight.background,
  onSecondary: kEsnyaColorsLight.background,
  onSurface: kEsnyaColorsLight.textPrimary,
  surface: kEsnyaColorsLight.background,
);
