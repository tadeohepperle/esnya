import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';

final esnyaTextThemeLight = const TextTheme(
  headlineLarge: TextStyle(
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.bold,
  ),
  headlineMedium: TextStyle(
    fontSize: 26,
    height: 32 / 26,
    fontWeight: FontWeight.bold,
  ),
  headlineSmall: TextStyle(
    fontSize: 20,
    height: 24 / 20,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
    fontSize: 16,
    height: 1, // same as titleMedium just fatter for titles and such
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    height: 1, // This is such that Buttons and stuff are vertically centered.
    fontWeight: FontWeight.normal,
  ),
  titleSmall: TextStyle(
    fontSize: 12,
    height: 1,
    fontWeight: FontWeight.bold,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.bold,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.bold,
  ),
).apply(
  bodyColor: esnyaColorsLight.textPrimary,
  displayColor: esnyaColorsLight.textPrimary,
);
