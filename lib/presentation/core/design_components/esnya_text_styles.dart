import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';

final esnyaTextThemeLight = const TextTheme(
  headlineLarge: TextStyle(
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.bold,
  ),
  headlineMedium: TextStyle(
    fontSize: 30,
    height: 38 / 30,
    fontWeight: FontWeight.bold,
  ),
  headlineSmall: TextStyle(
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    height: 1, // This is such that Buttons and stuff are vertically centered.
    fontWeight: FontWeight.w500,
  ),
  titleSmall: TextStyle(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
  ),
  bodySmall: TextStyle(
    fontSize: 10,
    height: 14 / 10,
    fontWeight: FontWeight.w500,
  ),
).apply(
  bodyColor: esnyaColorsLight.textPrimary,
  displayColor: esnyaColorsLight.textPrimary,
);
