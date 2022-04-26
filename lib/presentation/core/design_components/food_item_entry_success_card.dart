import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/core/models/user_data/food_item_entry.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';
import 'esnya_sizes.dart';
import 'esnya_text.dart';
import 'nutrient_table.dart';

class FoodItemEntrySuccessCard extends StatefulWidget {
  final FoodItemEntrySuccess foodItemEntry;
  final VoidCallback? onDeleteButtonClick;
  final VoidCallback? onCloseButtonClick;
  final VoidCallback? onTimeButtonClick;
  final VoidCallback? onAmountButtonClick;
  const FoodItemEntrySuccessCard({
    Key? key,
    required this.foodItemEntry,
    this.onDeleteButtonClick,
    this.onTimeButtonClick,
    this.onAmountButtonClick,
    this.onCloseButtonClick,
  }) : super(key: key);

  @override
  State<FoodItemEntrySuccessCard> createState() =>
      _FoodItemEntrySuccessCardState();
}

class _FoodItemEntrySuccessCardState extends State<FoodItemEntrySuccessCard> {
  bool showsPer100g = false;

  void _toggleSwitch() {
    setState(() {
      showsPer100g = !showsPer100g;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LanguageRepository langRepo = getIt<LanguageRepository>();
    final colorScheme = getColorScheme(context);
    final foodItem = widget.foodItemEntry.foodItem;

    Map<NutrientType, Amount>? nutrientAmounts;
    if (!showsPer100g) {
      nutrientAmounts = foodItem.getNutrientAmounts().toOption().toNullable();
    } else {
      nutrientAmounts = foodItem
          .copyWith(amount: const Amount(MeasureUnit.g, 100))
          .getNutrientAmounts()
          .toOption()
          .toNullable();
    }

    final kcal = nutrientAmounts?[NutrientType.energy];
    print(kcal);

    final dateTodayRelation =
        computeDateTodayRelation(widget.foodItemEntry.dateTime);
    final dateTimeString = langRepo.translateDate(
      widget.foodItemEntry.dateTime,
      includeYear: true,
      includeTime: true,
      dateTodayRelation: dateTodayRelation,
      replaceDateByTodayRelation: true,
    );

    return shadowWrapLarge(
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              EsnyaIconButton.custom(
                Icons.delete,
                onPressed: widget.onDeleteButtonClick,
                getColor: (c) => c.surface,
                getIconColor: (c) => c.secondary,
                shadowSize: ShadowSize.none,
              ),
              EsnyaSizes.spaceBaseWidth,
              EsnyaIconButton.custom(
                Icons.close,
                onPressed: widget.onCloseButtonClick,
                getColor: (c) => c.surface,
                getIconColor: (c) => c.onSurface,
                shadowSize: ShadowSize.none,
              ),
            ],
          ),
          EsnyaSizes.spaceBaseHeight,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(EsnyaSizes.base),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(EsnyaSizes.base * 2)),
              color: colorScheme.surface,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EsynaButton.custom(
                      onPressed: widget.onAmountButtonClick,
                      title: langRepo.translateAmount(foodItem.amount),
                      customPadding: const EdgeInsets.all(EsnyaSizes.base),
                      shadowSize: ShadowSize.none,
                    ),
                    EsynaButton.custom(
                      onPressed: widget.onTimeButtonClick,
                      title: dateTimeString,
                      customPadding: const EdgeInsets.all(EsnyaSizes.base),
                      shadowSize: ShadowSize.none,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(EsnyaSizes.base),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          EsnyaText.h3(foodItem.food.title),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Icon(
                                      EsnyaIcons.energy,
                                      color: kcal != null
                                          ? colorScheme.secondary
                                          : esnyaColorsLight.textSecondary,
                                    ),
                                    EsnyaSizes.spaceBaseWidth2,
                                    EsnyaText.h3(
                                      kcal != null
                                          ? langRepo.translateAmount(kcal,
                                              fractionDigits: 0)
                                          : "unknown kcal",
                                      color: kcal != null
                                          ? colorScheme.secondary
                                          : esnyaColorsLight.textSecondary,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildPill(
                                          langRepo
                                              .translateAmount(foodItem.amount),
                                          !showsPer100g),
                                      EsnyaSizes.spaceBaseWidth,
                                      _buildPill(
                                          langRepo.translateAmount(
                                              const Amount(MeasureUnit.g, 100)),
                                          showsPer100g)
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        height: EsnyaSizes.base * 4,
                      ),
                      if (nutrientAmounts != null)
                        NutrientTable(
                          nutrientAmounts: nutrientAmounts,
                          nutrientTypes: const [
                            NutrientType.protein,
                            NutrientType.carbs,
                            NutrientType.fat,
                            NutrientType.fiber
                          ],
                        )
                      else
                        Container(
                          height: 64,
                          child: Center(
                              child: Column(
                            children: [
                              Icon(Icons.warning),
                              EsnyaText.body("No Data Available")
                            ],
                          )),
                        ),
                      const Divider(
                        height: EsnyaSizes.base * 4,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPill(
    String title,
    bool active,
  ) =>
      EsynaButton.custom(
        title: title,
        shadowSize: active ? ShadowSize.small : ShadowSize.none,
        shape: EsnyaSizes.roundedButtonBorder,
        getColor: (c) => active ? c.onSurface : c.surface,
        getTextColor: (c) => active ? c.surface : c.onSurface,
        customPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        onPressed: () => !active ? _toggleSwitch() : null,
      );
}
