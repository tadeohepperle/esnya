import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../../../../application/food_data/input/models/food_item_entry_wrapper.dart';
import '../../../../injection.dart';
import '../../design_components/esnya_design_utils.dart';
import '../../design_components/esnya_sizes.dart';
import '../../design_components/esnya_text.dart';

class FoodItemEntryProcessingListTile extends StatelessWidget {
  final FoodItemEntryProcessing processing;
  final NutrientType badgeNutrient;
  final VoidCallback onTap;
  const FoodItemEntryProcessingListTile({
    Key? key,
    required this.processing,
    required this.onTap,
    this.badgeNutrient = NutrientType.energy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final titleColor = colorScheme.onBackground;
    final amountColor = colorScheme.onBackground;
    final LanguageRepository langRepo = getIt<LanguageRepository>();
    final amountTitle =
        langRepo.translateAmount(processing.amount, shortened: true);

    return Shadow(
      MaterialButton(
        onPressed: onTap,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        height: EsnyaSizes.kFoodItemEntryListTileHeight,
        padding: const EdgeInsets.only(left: 8, right: 8),
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
            EsnyaText.titleBold(amountTitle, color: amountColor),
            Expanded(
              child: EsnyaText.titleBold(
                "   ${processing.inputFoodName} ",
                // TODO: IMPORTANT-PRE-RELEASE: translations for title
                // TODO: ellipsis
                color: titleColor,
              ),
            ),
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                color: colorScheme.onBackground,
                strokeWidth: 2.3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
