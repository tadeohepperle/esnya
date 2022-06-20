import 'package:esnya/application/food_data/input/models/food_item_entry_wrapper.dart';
import 'package:esnya/domain/user_data/user_diet_preferences_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../../design_components/esnya_design_utils.dart';
import '../../design_components/esnya_icons.dart';

class FoodItemEntryListTile extends StatelessWidget {
  final FoodItemEntry foodItemEntry;
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

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final title = foodItemEntry.foodMappingObject.title;
    final titleColor = colorScheme.onSurface;
    final amountColor = colorScheme.primary;
    final LanguageRepository langRepo = getIt<LanguageRepository>();

    final translatedAmount =
        langRepo.translateAmount(foodItemEntry.foodItem.amount);

    return Shadow(
      MaterialButton(
        onPressed: onTap,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        height: EsnyaSizes.kFoodItemEntryListTileHeight,
        padding: const EdgeInsets.only(left: 8, right: 5),
        minWidth: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
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
            TrailingBadge(
              nutrientAmount:
                  foodItemEntry.foodItem.computedNutrientAmounts[badgeNutrient],
              badgeNutrient: badgeNutrient,
              onPressed: onBadgeTap,
            )
          ],
        ),
      ),
    );
  }
}

class TrailingBadge extends StatelessWidget {
  final NutrientType badgeNutrient;
  final Amount? nutrientAmount;
  final VoidCallback onPressed;
  TrailingBadge({
    required this.nutrientAmount,
    required this.badgeNutrient,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  IconData? _badgeIcon() {
    if (badgeNutrient == NutrientType.energy) {
      return null;
    }
    return EsnyaIcons.nutrientIcons[badgeNutrient];
  }

  @override
  Widget build(BuildContext context) {
    final langRepo = getIt<LanguageRepository>();
    final userDietPreferencesRepository =
        getIt<UserDietPreferencesRepository>();

    final isPrimary =
        userDietPreferencesRepository.preferredNutrientPrimary == badgeNutrient;
    final String badgeTitle = nutrientAmount == null
        ? "unknown"
        : langRepo.translateAmount(nutrientAmount!, fractionDigits: 0);
    if (isPrimary) {
      return EsynaButton.primary(
        title: badgeTitle,
        leadingIcon: _badgeIcon(),
        onPressed: onPressed,
        buttonSize: ButtonSize.small,
      );
    } else {
      return EsynaButton.secondary(
        title: badgeTitle,
        leadingIcon: _badgeIcon(),
        onPressed: onPressed,
        buttonSize: ButtonSize.small,
      );
    }
  }
}
