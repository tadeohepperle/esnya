import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';

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
  secondary: Color.fromARGB(255, 56, 95, 202),
  error: Color.fromARGB(255, 255, 89, 89),
  surface: Color.fromARGB(255, 255, 255, 255),
  background: Color.fromARGB(255, 241, 241, 241),
  textPrimary: Color.fromARGB(255, 46, 46, 46),
  textSecondary: Color.fromARGB(255, 163, 160, 159),
  textTertiary: Color.fromARGB(255, 207, 207, 207),
  shadow: Color.fromARGB(40, 0, 0, 0),
);

final colorSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: esnyaColorsLight.primary,
  secondary: esnyaColorsLight.secondary,
  error: esnyaColorsLight.error,
  surface: esnyaColorsLight.surface,
  background: esnyaColorsLight.background,

  // textSecondary => onBackground, textPrimary => onSurface, This is more like a workaround.
  onSurface: esnyaColorsLight.textPrimary,
  onBackground: esnyaColorsLight.textSecondary,
  onSurfaceVariant: esnyaColorsLight.textTertiary,
  onError: esnyaColorsLight.surface,
  onPrimary: esnyaColorsLight.surface,
  onSecondary: esnyaColorsLight.surface,
  shadow: esnyaColorsLight.shadow,

  outline: esnyaColorsLight.textSecondary,
);

// TODO: remove all below:
final Map<NutrientType, Color> _nutrientColorMap = {
  NutrientType.protein: esnyaColorsLight.primary,
  NutrientType.energy: esnyaColorsLight.secondary,
};

final Map<NutrientType, GetColor> _nutrientGetColorMap = {
  NutrientType.protein: (c) => c.primary,
  NutrientType.energy: (c) => c.secondary,
};

Color mapNutrientToColor(NutrientType nutrientType,
    [ColorScheme? colorScheme]) {
  if (colorScheme != null) {
    return _nutrientGetColorMap[nutrientType]?.call(colorScheme) ??
        colorScheme.onSurface;
  } else {
    return _nutrientColorMap[nutrientType] ?? esnyaColorsLight.textPrimary;
  }
}
