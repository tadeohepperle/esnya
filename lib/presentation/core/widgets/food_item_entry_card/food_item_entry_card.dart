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
  final VoidCallback? onCloseButtonClick;
  final VoidCallback? onTimeButtonClick;
  final VoidCallback? onAmountButtonClick;
  const FoodItemEntryCard({
    Key? key,
    required this.foodItemEntry,
    this.onDeleteButtonClick,
    this.onTimeButtonClick,
    this.onAmountButtonClick,
    this.onCloseButtonClick,
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

    return Column(
      children: [
        ButtonsAboveCard(
          onDeleteButtonClick: widget.onDeleteButtonClick,
          onCloseButtonClick: widget.onCloseButtonClick,
        ),
        EsnyaSizes.spaceBaseHeight,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(EsnyaSizes.base),
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(EsnyaSizes.base)),
            color: colorScheme.surface,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                                        : colorScheme.onBackground,
                                  ),
                                  EsnyaSizes.spaceBaseWidth2,
                                  EsnyaText.h3(
                                    kcal != null
                                        ? langRepo.translateAmount(kcal,
                                            fractionDigits: 0)
                                        : "unknown kcal",
                                    color: kcal != null
                                        ? colorScheme.secondary
                                        : colorScheme.onBackground,
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
              )
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
