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
    height: 24 / 16,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.bold,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.normal,
  ),
  bodySmall: TextStyle(
    fontSize: 10,
    height: 14 / 10,
    fontWeight: FontWeight.normal,
  ),
).apply(
  bodyColor: kEsnyaColorsLight.textPrimary,
  displayColor: kEsnyaColorsLight.textPrimary,
);
