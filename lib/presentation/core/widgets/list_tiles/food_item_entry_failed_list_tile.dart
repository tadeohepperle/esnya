import 'package:esnya/application/food_data/input/models/food_item_entry_wrapper.dart';
import 'package:esnya/domain/user_data/user_diet_preferences_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../../design_components/esnya_design_utils.dart';
import '../../design_components/esnya_icons.dart';

class FoodItemEntryFailedListTile extends StatelessWidget {
  final FoodItemEntryFailed failed;
  final NutrientType badgeNutrient;
  final VoidCallback onTap;
  final void Function(DismissDirection)? onDismissed;
  const FoodItemEntryFailedListTile({
    Key? key,
    required this.failed,
    required this.onTap,
    this.onDismissed,
    this.badgeNutrient = NutrientType.energy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final titleColor = colorScheme.onBackground;
    final amountColor = colorScheme.onBackground;
    final LanguageRepository langRepo = getIt<LanguageRepository>();
    final amountTitle = langRepo.translateAmount(failed.amount);

    return Dismissible(
      onDismissed: onDismissed,
      key: Key(failed.uniqueId.value),
      child: Shadow(
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
              EsnyaText.title(amountTitle, color: amountColor),
              Expanded(
                  child: EsnyaText.title(
                "   ${failed.inputFoodName} ",
                // TODO: IMPORTANT-PRE-RELEASE: translations for title
                // TODO: ellipsis
                color: titleColor,
              )),
              EsnyaText.titleSmall(
                "No Food Found!",
                color: colorScheme.error,
              ),
            ],
          ),
        ),
      ),
    );
  }
}