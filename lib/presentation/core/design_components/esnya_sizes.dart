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

  static const double kDashboardHeaderheightWithoutUnsafeArea = 164;
  static const double kDashboardContainerBelowListViewHeight = 64;

  static const double kFoodItemEntryListTileHeight = 36;
  static const double kFoodItemEntryListTilePaddingBelow = 8.0;
  static const double kBucketDateTitleListItemHeight = 40;
  static const double kDashboardPaddingBetweenBucketsInListView = 30;
  static const double kNoEntriesYetListItemHeight = 100;

  static RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(base),
    side: BorderSide.none,
  );

  static Padding paddingWrap(Widget child, [double paddingSize = base]) =>
      Padding(
        padding: EdgeInsets.all(paddingSize),
        child: child,
      );

  static const SizedBox spaceBaseWidth = SizedBox(
    width: base,
  );
  static const SizedBox spaceBaseWidth2 = SizedBox(
    width: base * 2,
  );

  static const SizedBox spaceBaseHeight = SizedBox(
    height: base,
  );

  static const SizedBox spaceBaseHeight2 = SizedBox(
    height: base * 2,
  );

  static const paddingBase = EdgeInsets.all(base);
  static const paddingBase2 = EdgeInsets.all(base * 2);
}
