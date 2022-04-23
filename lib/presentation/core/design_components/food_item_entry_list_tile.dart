import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';
import 'esnya_icons.dart';

enum BadgeDisplayMode { kcal, protein }

class FoodItemEntryListTile extends StatelessWidget {
  final FoodItemEntry foodItemEntry;
  final BadgeDisplayMode badgeDisplayMode;
  const FoodItemEntryListTile({
    Key? key,
    required this.foodItemEntry,
    this.badgeDisplayMode = BadgeDisplayMode.kcal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final loading = foodItemEntry.map(
      semanticSuccess: (_) => true,
      success: (_) => false,
    );
    final title = foodItemEntry.map(
      semanticSuccess: (_) => _.title,
      success: (_) => _.foodItem.food.title,
    );
    final amount = foodItemEntry.map(
      semanticSuccess: (_) => _.amount,
      success: (_) => _.foodItem.amount,
    );
    final textColor = foodItemEntry.map(
      semanticSuccess: (_) => esnyaColorsLight.textSecondary,
      success: (_) => colorScheme.onSurface,
    );

    final LanguageRepository langRepo = getIt<LanguageRepository>();

    return shadowWrapLarge(
      Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        padding: const EdgeInsets.only(left: 16),
        height: 36,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: EsnyaText.titleBold(
                langRepo.translateAmount(amount),
                color: textColor,
              ),
            ),
            const SizedBox(
              width: EsnyaSizes.base,
            ),
            Expanded(
                flex: 10,
                child: EsnyaText.titleBold(
                  title,
                  color: textColor,
                )),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FoodItemEntryListTileBadge(
                  title: "3.4 g",
                  onTap: () {
                    print("tAPPAAPPAPA");
                  },
                  iconData: EsnyaIcons.protein,
                  badgeDisplayMode: badgeDisplayMode,
                ),
                Container(
                  height: 18,
                  padding: EdgeInsets.only(right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      EsnyaText.bodySmall(
                        "11:23 am",
                        color: esnyaColorsLight.textSecondary,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FoodItemEntryListTileBadge extends StatelessWidget {
  final BadgeDisplayMode badgeDisplayMode;
  final IconData? iconData;
  final String title;
  final VoidCallback onTap;
  FoodItemEntryListTileBadge({
    required this.title,
    this.badgeDisplayMode = BadgeDisplayMode.kcal,
    this.iconData,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  static final Map<BadgeDisplayMode, GetColor> _mapBadgeModeToColor = {
    BadgeDisplayMode.kcal: (c) => c.secondary,
    BadgeDisplayMode.protein: (c) => c.primary,
  };

  @override
  Widget build(BuildContext context) {
    return _buildPill(context);
  }

  Widget _buildPill(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final color = _mapBadgeModeToColor[badgeDisplayMode]!(colorScheme);
    return MaterialButton(
      onPressed: onTap,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      height: 18,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      minWidth: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(4),
        ),
        side: BorderSide.none,
      ),
      color: color,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (iconData != null)
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: Transform.translate(
                offset: Offset(0, -1),
                child: Icon(
                  iconData,
                  size: 10,
                  color: colorScheme.surface,
                ),
              ),
            ),
          EsnyaText.titleSmall(
            title,
            color: colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
