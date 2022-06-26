import 'package:esnya/domain/core/utils.dart';
import 'package:esnya/presentation/core/design_components/design_components.dart';
import 'package:esnya/presentation/core/design_components/utils/show_padded_dialog.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry/amount_picker.dart';
import 'package:esnya_shared_resources/core/conversion/measure_unit_conversion.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../nutrient_table.dart';
import 'buttons_above_card.dart';

/// when changes to are made to the [foodItemEntry], onUpdateEntry  can be used to put these changes into firebase.
class FoodItemEntryCard extends StatefulWidget {
  final FoodItemEntry foodItemEntry;

  final Function(FoodItemEntry updatedFoodItemEntry)? onUpdateEntry;
  final Function(FoodItemEntry deletedEntry)? onDeleteEntry;
  const FoodItemEntryCard({
    Key? key,
    required this.foodItemEntry,
    this.onDeleteEntry,
    this.onUpdateEntry,
  }) : super(key: key);

  @override
  State<FoodItemEntryCard> createState() => _FoodItemEntryCardState();
}

class _FoodItemEntryCardState extends State<FoodItemEntryCard> {
  bool showsPer100g = false;
  late FoodItemEntry foodItemEntry = widget.foodItemEntry;

  void _toggleSwitch() {
    setState(() {
      showsPer100g = !showsPer100g;
    });
  }

  void _showTimeChangeDialog(BuildContext context) async {
    final time = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 12, minute: 32));
    if (time != null) {
      final newDateTime = foodItemEntry.dateTime.applyTimeOfDay(time);
      setState(() {
        foodItemEntry = foodItemEntry.copyWith(dateTime: newDateTime);
      });
      widget.onUpdateEntry?.call(foodItemEntry);
    }
  }

  void _showDateChangeDialog(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: foodItemEntry.dateTime,
      firstDate: DateTime.parse("2022-06-01"),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      final newDateTime =
          date.applyTimeOfDay(TimeOfDay.fromDateTime(foodItemEntry.dateTime));
      setState(() {
        foodItemEntry = foodItemEntry.copyWith(dateTime: newDateTime);
      });
      widget.onUpdateEntry?.call(foodItemEntry);
    }
  }

  void _showAmountChangeDialog(BuildContext context) {
    showPaddedDialog<Amount>(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AmountPicker(foodItemEntry: foodItemEntry);
        }).then((Amount? newAmount) {
      if (newAmount != null) {
        setState(() {
          final newFoodItem =
              foodItemEntry.foodItem.copyWithAndRecompute(amount: newAmount);
          foodItemEntry = foodItemEntry.copyWith(foodItem: newFoodItem);
        });
        widget.onUpdateEntry?.call(foodItemEntry);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final LanguageRepository langRepo = getIt<LanguageRepository>();
    final colorScheme = getColorScheme(context);
    final foodItem = foodItemEntry.foodItem;

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
    final dateTodayRelation = computeDateTodayRelation(foodItemEntry.dateTime);
    final dateString = langRepo.translateDate(
      foodItemEntry.dateTime,
      includeYear: true,
      // includeTime: true,
      dateTodayRelation: dateTodayRelation,
      replaceDateByTodayRelation: true,
    );
    final timeString = langRepo.translateTime(foodItemEntry.dateTime);

    final translatedAmount = langRepo.translateAmount(foodItem.amount);

    // TODO

    // construct switch texts
    String switchLeftText =
        langRepo.translateAmount(foodItemEntry.foodItem.amount);

    if (foodItemEntry.foodItem.amount.unit != MeasureUnit.g) {
      final amountInGrams = convertAmountToMeasureUnit(
        foodItemEntry.foodItem.amount,
        MeasureUnit.g,
        food: foodItemEntry.foodItem.food,
      ).toOption().toNullable()!;
      switchLeftText += ' (${langRepo.translateAmount(amountInGrams)})';
    }

    final switchRightText =
        langRepo.translateAmount(const Amount(MeasureUnit.g, 100));

    final kcalLabelColor =
        kcal != null ? colorScheme.primary : colorScheme.onBackground;

    MapEntry<NutrientType, Amount>? mainNutrientAndAmount = null;
    foodItem.food.nutrients.forEach((k, v) {
      if (k.unit != MeasureUnit.g) {
        return;
      }
      if (mainNutrientAndAmount == null ||
          v >= mainNutrientAndAmount!.value.number) {
        mainNutrientAndAmount = MapEntry(k, Amount(MeasureUnit.g, v));
      }
    });

    return Column(
      children: [
        ButtonsAboveCard(
          onDeleteButtonClick: () {
            Navigator.of(context).pop();
            widget.onDeleteEntry?.call(foodItemEntry);
          },
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
                        onPressed: () {
                          _showAmountChangeDialog(context);
                        },
                        title: translatedAmount,
                      ),
                      Row(
                        children: [
                          EsynaButton.surface(
                            onPressed: () {
                              _showDateChangeDialog(context);
                            },
                            title: dateString,
                          ),
                          EsnyaSizes.spaceBaseWidth,
                          EsynaButton.surface(
                            onPressed: () {
                              _showTimeChangeDialog(context);
                            },
                            title: timeString,
                          ),
                        ],
                      )
                    ],
                  ),
                  EsnyaSizes.spaceBaseHeight2,
                  EsnyaText.h2(
                      foodItemEntry.foodMappingObject.title.toCapitalized()),
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
                    NutrientType.fiber,
                    // NutrientType.water
                  ],
                )
              else
                Container(
                  height: 64,
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.warning), // TODO
                        EsnyaText.body("No Nutrient Data Available")
                      ],
                    ),
                  ),
                ),
              const Divider(
                height: EsnyaSizes.base * 4,
              ),
              EsnyaText.body(
                "${foodItem.food.title} is mainly consisting of ${langRepo.translateNutrientType(mainNutrientAndAmount!.key)}, of which it has ${langRepo.translateAmount(mainNutrientAndAmount!.value)} per 100 g.",
                color: colorScheme.onBackground,
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
