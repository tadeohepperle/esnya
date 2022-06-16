import 'package:esnya/application/food_data/input/models/food_item_entry_wrapper.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../../design_components/esnya_design_utils.dart';
import '../../design_components/esnya_sizes.dart';
import '../../design_components/esnya_text.dart';
import 'buttons_above_card.dart';

class FoodItemEntryFailedCard extends StatefulWidget {
  final FoodItemEntryFailed foodItemEntryFailed;
  final VoidCallback? onDeleteButtonClick;
  final VoidCallback? onCloseButtonClick;
  final VoidCallback? onTimeButtonClick;
  final VoidCallback? onAmountButtonClick;
  const FoodItemEntryFailedCard({
    Key? key,
    required this.foodItemEntryFailed,
    this.onDeleteButtonClick,
    this.onTimeButtonClick,
    this.onAmountButtonClick,
    this.onCloseButtonClick,
  }) : super(key: key);

  @override
  State<FoodItemEntryFailedCard> createState() =>
      _FoodItemEntryFailedCardState();
}

class _FoodItemEntryFailedCardState extends State<FoodItemEntryFailedCard> {
  bool showsPer100g = false;

  void _toggleSwitch() {
    setState(() {
      showsPer100g = !showsPer100g;
    });
  }

  @override
  Widget build(BuildContext context) {
    final entry = widget.foodItemEntryFailed;
    final LanguageRepository langRepo = getIt<LanguageRepository>();
    final colorScheme = getColorScheme(context);

    final dateTodayRelation = computeDateTodayRelation(entry.dateTime);
    final dateTimeString = langRepo.translateDate(
      widget.foodItemEntryFailed.dateTime,
      includeYear: true,
      includeTime: true,
      dateTodayRelation: dateTodayRelation,
      replaceDateByTodayRelation: true,
    );

    final translatedAmount = langRepo.translateAmount(entry.amount);

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    EsnyaText.h3(entry.inputFoodName),
                    const Divider(
                      height: EsnyaSizes.base * 4,
                    ),
                    //TODO: what if this item is not mappingfailed but loading instead?
                    EsnyaText.body(
                        'Our database does not contain any food that matches the input "${entry.inputFoodName}". Delete this item with the trashcan button and try again.'),
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
