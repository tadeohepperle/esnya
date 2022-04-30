import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../design_components/esnya_design_utils.dart';
import '../design_components/esnya_icons.dart';

enum BadgeDisplayMode { kcal, protein }

class FoodItemEntryListTile extends StatelessWidget {
  final FoodItemEntry foodItemEntry;
  final BadgeDisplayMode badgeDisplayMode;
  final VoidCallback onTap;
  final VoidCallback onBadgeTap;
  final double amountBoxWidth;
  FoodItemEntryListTile({
    Key? key,
    required this.foodItemEntry,
    this.badgeDisplayMode = BadgeDisplayMode.kcal,
    required this.onTap,
    required this.onBadgeTap,
    this.amountBoxWidth = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final isSuccess = foodItemEntry.map(
      semanticSuccess: (_) => false,
      success: (_) => true,
    );
    final title = foodItemEntry.map(
      semanticSuccess: (_) => _.title,
      success: (_) => _.foodItem.food.title,
    );
    final amount = foodItemEntry.map(
      semanticSuccess: (_) => _.amount,
      success: (_) => _.foodItem.amount,
    );
    final textColor =
        isSuccess ? colorScheme.onSurface : colorScheme.onBackground;

    final LanguageRepository langRepo = getIt<LanguageRepository>();

    final badgeIconData = badgeDisplayMode == BadgeDisplayMode.protein
        ? EsnyaIcons.protein
        : null;

    String? badgeTitle = foodItemEntry.map(
        semanticSuccess: (_) => null,
        success: (success) {
          NutrientType nutrientType =
              badgeDisplayMode == BadgeDisplayMode.protein
                  ? NutrientType.protein
                  : NutrientType.energy;

          final nutrientValue = success.foodItem.food.nutrients[nutrientType];
          if (nutrientValue != null) {
            return langRepo
                .translateAmount(Amount(nutrientType.unit, nutrientValue));
          }
          return null;
        });

    Widget _buildEndOfColumnForSuccess(FoodItemEntrySuccess success) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FoodItemEntryListTileBadge(
            title: badgeTitle!,
            onTap: onBadgeTap,
            iconData: badgeIconData,
            badgeDisplayMode: badgeDisplayMode,
          ),
          _buildTimeDisplay(context, success.dateTime, langRepo)
        ],
      );
    }

    Widget _buildEndOfColumnForFailed(
        FoodItemEntrySemanticSuccess semanticSuccess) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(right: 8, top: 4),
              height: 18,
              child: EsnyaText.titleSmall("not found",
                  color: esnyaColorsLight.error)),
          _buildTimeDisplay(context, semanticSuccess.dateTime, langRepo)
        ],
      );
    }

    Widget _buildEndOfColumnForLoading(
        FoodItemEntrySemanticSuccess semanticSuccess) {
      return Container(
        padding: EdgeInsets.all(8),
        height: 36,
        width: 36,
        child: CircularProgressIndicator(
            color: esnyaColorsLight.textTertiary, strokeWidth: 3),
      );
    }

    Widget endOfRowElement = foodItemEntry.map(
      semanticSuccess: (semanticSuccess) => semanticSuccess.mappingFailed
          ? _buildEndOfColumnForFailed(semanticSuccess)
          : _buildEndOfColumnForLoading(semanticSuccess),
      success: (success) => _buildEndOfColumnForSuccess(success),
    );

    return shadowWrapLarge(
      MaterialButton(
        onPressed: onTap,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        height: 36,
        padding: const EdgeInsets.only(left: 12),
        minWidth: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          side: BorderSide.none,
        ),
        color: colorScheme.surface,
        disabledColor: colorScheme.surface,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: amountBoxWidth,
              child: EsnyaText.titleBold(
                langRepo.translateAmount(amount),
                color: textColor,
              ),
            ),
            Expanded(
                child: EsnyaText.titleBold(
              title, // TODO: IMPORTANT-PRE-RELEASE: translations for title
              color: textColor,
            )),
            endOfRowElement
          ],
        ),
      ),
    );
  }

  Widget _buildTimeDisplay(
      BuildContext context, DateTime dateTime, LanguageRepository langRepo) {
    final colorScheme = getColorScheme(context);
    return Container(
      height: 18,
      padding: EdgeInsets.only(right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EsnyaText.bodySmall(
            langRepo.translateTime(dateTime),
            color: colorScheme.onBackground,
          )
        ],
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
              padding: EdgeInsets.only(right: 8),
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
