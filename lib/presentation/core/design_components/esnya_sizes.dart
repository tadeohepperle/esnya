import 'package:flutter/material.dart';

abstract class EsnyaSizes {
  static const double base = 8.0;
  static double get roundedCorner => base;
  static double get roundedCornerSmall => base / 2;
  static double get roundedCornerLarge => base * 2;

  static const double kEsnyaBottomNavigationTabHeight = 48.0;
  static const double kEsnyaBottomNavigationIndicatorHeight = 2.0;
  static const double kEsnyaBottomNavigationBarHeight =
      kEsnyaBottomNavigationTabHeight + kEsnyaBottomNavigationIndicatorHeight;

  static const double kDashboardHeaderheightWithoutUnsafeArea = 192;
  static const double kDashboardContainerBelowListViewHeight = 64;

  static const double kFoodItemEntryListTileHeight = 28.0;
  static const double kFoodItemEntryListTilePaddingBelow = 4.0;
  static const double kBucketDateTitleListItemHeight = 40;
  static const double kDashboardPaddingBetweenBuckets = 16;
  static const double kNoEntriesYetListItemHeight = 100;

  static RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(base),
    side: BorderSide.none,
  );

  static const borderRadius = BorderRadius.all(Radius.circular(8));

  static Padding paddingWrap(Widget child, [double paddingSize = base]) =>
      Padding(
        padding: EdgeInsets.all(paddingSize),
        child: child,
      );

  /// SizedBox with width 8px
  static const SizedBox spaceBaseWidth = SizedBox(
    width: base,
  );

  /// SizedBox with width 16px
  static const SizedBox spaceBaseWidth2 = SizedBox(
    width: base * 2,
  );

  /// SizedBox with width 12px
  static const SizedBox spaceBaseWidth1_5 = SizedBox(
    width: base * 1.5,
  );

  /// SizedBox with height 8px
  static const SizedBox spaceBaseHeight = SizedBox(
    height: base,
  );

  /// SizedBox with height 16px
  static const SizedBox spaceBaseHeight2 = SizedBox(
    height: base * 2,
  );

  /// SizedBox with height 12px
  static const SizedBox spaceBaseHeight1_5 = SizedBox(
    height: base * 1.5,
  );

  /// EdgeInsets.all(8 px)
  static const paddingBase = EdgeInsets.all(base);

  /// EdgeInsets.all(16 px)
  static const paddingBase2 = EdgeInsets.all(base * 2);
}

enum ButtonSize { small, medium, large, xxl }
