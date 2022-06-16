import 'package:dartz/dartz.dart';
import 'package:esnya/application/food_data/input/models/food_item_entry_wrapper.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../design_components/esnya_design_utils.dart';
import '../design_components/esnya_icons.dart';

class FoodItemEntryListTile extends StatelessWidget {
  final FoodItemEntryWrapper foodItemEntry;
  final NutrientType badgeNutrient;
  final VoidCallback onTap;
  final VoidCallback onBadgeTap;
  FoodItemEntryListTile({
    Key? key,
    required this.foodItemEntry,
    required this.onTap,
    required this.onBadgeTap,
    this.badgeNutrient = NutrientType.energy,
  }) : super(key: key);

  IconData? _badgeIcon() {
    if (badgeNutrient == NutrientType.energy) {
      return null;
    }
    return EsnyaIcons.nutrientIcons[badgeNutrient];
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final isSuccess = foodItemEntry.maybeMap(
      orElse: () => false,
      success: (_) => true,
    );
    final title = foodItemEntry
        .maybeMap(
            orElse: () => foodItemEntry.inputString,
            success: (_) => _.entry.foodItem.food.title)
        .toLowerCase();

    // TODO: this should rather be done in data source.
    final amount = foodItemEntry.map(
      failed: (_) => _.amount,
      processing: (_) => _.amount,
      success: (_) => _.entry.foodItem.amount,
    );
    final titleColor =
        isSuccess ? colorScheme.onSurface : colorScheme.onBackground;
    final amountColor =
        isSuccess ? colorScheme.primary : colorScheme.onBackground;

    final LanguageRepository langRepo = getIt<LanguageRepository>();

    final badgeIcon = _badgeIcon();

    String? badgeTitle = foodItemEntry.maybeMap(
        orElse: () => null,
        success: (success) {
          final amount =
              success.entry.foodItem.computedNutrientAmounts[badgeNutrient];
          if (amount == null) {
            return "unknown";
          }
          return langRepo.translateAmount(amount, fractionDigits: 0);
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
            iconData: badgeIcon,
            badgeNutrient: badgeNutrient,
          ),
          _buildTimeDisplay(context, success.entry.dateTime, langRepo)
        ],
      );
    }

    Widget _buildEndOfColumnForFailed(FoodItemEntryFailed failed) {
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
          _buildTimeDisplay(context, failed.dateTime, langRepo)
        ],
      );
    }

    Widget _buildEndOfColumnForProcessing(FoodItemEntryProcessing processing) {
      return Container(
        padding: EdgeInsets.all(8),
        height: 36,
        width: 36,
        child: CircularProgressIndicator(
            color: esnyaColorsLight.textTertiary, strokeWidth: 3),
      );
    }

    Widget endOfRowElement = foodItemEntry.map(
      failed: (failed) => _buildEndOfColumnForFailed(failed),
      processing: (processing) => _buildEndOfColumnForProcessing(processing),
      success: (success) => _buildEndOfColumnForSuccess(success),
    );
    final translatedAmount = langRepo.translateAmount(amount);

    return MaterialButton(
      onPressed: onTap,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      height: 36,
      padding: const EdgeInsets.only(left: 12),
      minWidth: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
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
          EsnyaText.titleBold(translatedAmount, color: amountColor),
          Expanded(
              child: EsnyaText.titleBold(
            "   $title ",
            // TODO: IMPORTANT-PRE-RELEASE: translations for title
            // TODO: ellipsis
            color: titleColor,
          )),
          endOfRowElement
        ],
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
  final NutrientType badgeNutrient;
  final IconData? iconData;
  final String title;
  final VoidCallback onTap;
  FoodItemEntryListTileBadge({
    required this.title,
    required this.badgeNutrient,
    this.iconData,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  static final Map<NutrientType, GetColor> _mapBadgeModeToColor = {
    NutrientType.energy: (c) => c.secondary,
    NutrientType.protein: (c) => c.primary,
  };

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final color = (_mapBadgeModeToColor[badgeNutrient] ??
        (c) => c.secondary)(colorScheme);
    return MaterialButton(
      onPressed: onTap,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      height: 18,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      minWidth: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
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
