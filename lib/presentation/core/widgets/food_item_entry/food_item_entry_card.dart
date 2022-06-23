import 'package:esnya/presentation/core/design_components/design_components.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../design_components/esnya_button.dart';
import '../../design_components/esnya_design_utils.dart';
import '../../design_components/esnya_icons.dart';
import '../../design_components/esnya_sizes.dart';
import '../../design_components/esnya_text.dart';
import '../nutrient_table.dart';
import 'buttons_above_card.dart';

class FoodItemEntryCard extends StatefulWidget {
  final FoodItemEntry foodItemEntry;
  final VoidCallback? onDeleteButtonClick;
  final VoidCallback? onTimeButtonClick;
  final VoidCallback? onAmountButtonClick;
  const FoodItemEntryCard({
    Key? key,
    required this.foodItemEntry,
    this.onDeleteButtonClick,
    this.onTimeButtonClick,
    this.onAmountButtonClick,
  }) : super(key: key);

  @override
  State<FoodItemEntryCard> createState() => _FoodItemEntryCardState();
}

class _FoodItemEntryCardState extends State<FoodItemEntryCard> {
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
    final dateTodayRelation =
        computeDateTodayRelation(widget.foodItemEntry.dateTime);
    final dateTimeString = langRepo.translateDate(
      widget.foodItemEntry.dateTime,
      includeYear: true,
      includeTime: true,
      dateTodayRelation: dateTodayRelation,
      replaceDateByTodayRelation: true,
    );

    final translatedAmount = langRepo.translateAmount(foodItem.amount);

    final switchLeftText = "2 servings (230g)";
    final switchRightText = "100 g";

    final kcalLabelColor =
        kcal != null ? colorScheme.primary : colorScheme.onBackground;

    return Column(
      children: [
        ButtonsAboveCard(
          onDeleteButtonClick: widget.onDeleteButtonClick,
          onCloseButtonClick: () {
            Navigator.of(context).pop();
          },
        ),
        EsnyaSizes.spaceBaseHeight,
        Container(
          width: double.infinity,
          padding: EsnyaSizes.paddingBase2,
          decoration: BoxDecoration(
            borderRadius: EsnyaSizes.borderRadius,
            color: colorScheme.surface,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EsynaButton.surface(
                        onPressed: widget.onAmountButtonClick,
                        title: translatedAmount,
                      ),
                      EsynaButton.surface(
                        onPressed: widget.onTimeButtonClick,
                        title: dateTimeString,
                      ),
                    ],
                  ),
                  EsnyaSizes.spaceBaseHeight2,
                  EsnyaSizes.spaceBaseHeight,
                  EsnyaText.h2(foodItem.food.title),
                  EsnyaSizes.spaceBaseHeight2,
                  Row(
                    children: [
                      Transform.translate(
                        offset: Offset(0, -1),
                        child: Icon(
                          EsnyaIcons.energy,
                          size: 26,
                          color: kcalLabelColor,
                        ),
                      ),
                      EsnyaSizes.spaceBaseWidth,
                      EsnyaText.h2(
                        kcal != null
                            ? langRepo.translateAmount(kcal, fractionDigits: 0)
                            : "unknown kcal",
                        color: kcalLabelColor,
                      )
                    ],
                  ),
                  EsnyaSizes.spaceBaseHeight2,
                  EsnyaSwitch(
                    value: showsPer100g,
                    leftText: switchLeftText,
                    rightText: switchRightText,
                    onChange: (val) {
                      if (val != showsPer100g) {
                        setState(() {
                          showsPer100g = val;
                        });
                      }
                    },
                  ),
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
                      Icon(Icons.warning), // TODO
                      EsnyaText.body("No Data Available")
                    ],
                  )),
                ),
              const Divider(
                height: EsnyaSizes.base * 4,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPill(
    String title,
    bool active,
  ) =>
      EsynaButton.primary(
        title: title,
        onPressed: () => !active ? _toggleSwitch() : null,
      );
}
