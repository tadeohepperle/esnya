import 'package:flutter/material.dart';

abstract class EsnyaSizes {
  static const double base = 8.0;
  static double get roundedCorner => base;
  static double get roundedCornerSmall => base / 2;
  static double get roundedCornerLarge => base * 2;

  static RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(base),
    side: BorderSide.none,
  );

  static Padding paddingWrap(Widget child, [double paddingSize = base]) =>
      Padding(
        padding: EdgeInsets.all(paddingSize),
        child: child,
      );
}
