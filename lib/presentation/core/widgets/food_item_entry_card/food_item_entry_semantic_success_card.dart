import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../../design_components/esnya_design_utils.dart';
import '../../design_components/esnya_sizes.dart';
import '../../design_components/esnya_text.dart';
import 'buttons_above_card.dart';

class FoodItemEntrySemanticSuccessCard extends StatefulWidget {
  final FoodItemEntrySemanticSuccess foodItemEntry;
  final VoidCallback? onDeleteButtonClick;
  final VoidCallback? onCloseButtonClick;
  final VoidCallback? onTimeButtonClick;
  final VoidCallback? onAmountButtonClick;
  const FoodItemEntrySemanticSuccessCard({
    Key? key,
    required this.foodItemEntry,
    this.onDeleteButtonClick,
    this.onTimeButtonClick,
    this.onAmountButtonClick,
    this.onCloseButtonClick,
  }) : super(key: key);

  @override
  State<FoodItemEntrySemanticSuccessCard> createState() =>
      _FoodItemEntrySemanticSuccessCardState();
}

class _FoodItemEntrySemanticSuccessCardState
    extends State<FoodItemEntrySemanticSuccessCard> {
  bool showsPer100g = false;

  void _toggleSwitch() {
    setState(() {
      showsPer100g = !showsPer100g;
    });
  }

  @override
  Widget build(BuildContext context) {
    final entry = widget.foodItemEntry;
    final LanguageRepository langRepo = getIt<LanguageRepository>();
    final colorScheme = getColorScheme(context);

    final dateTodayRelation = computeDateTodayRelation(entry.dateTime);
    final dateTimeString = langRepo.translateDate(
      widget.foodItemEntry.dateTime,
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
        shadowWrapLarge(Container(
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
                  EsynaButton.custom(
                    onPressed: widget.onAmountButtonClick,
                    title: translatedAmount,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    EsnyaText.h3(entry.title),
                    const Divider(
                      height: EsnyaSizes.base * 4,
                    ),
                    //TODO: what if this item is not mappingfailed but loading instead?
                    EsnyaText.body(
                        'Our database does not contain any food that matches the input "${entry.title}". Delete this item with the trashcan button and try again.'),
                    const Divider(
                      height: EsnyaSizes.base * 4,
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildPill(
    String title,
    bool active,
  ) =>
      EsynaButton.custom(
        title: title,
        shadowSize: active ? ShadowSize.small : ShadowSize.none,
        borderRadius: 100,
        getColor: (c) => active ? c.onSurface : c.surface,
        getTextColor: (c) => active ? c.surface : c.onSurface,
        customPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        onPressed: () => !active ? _toggleSwitch() : null,
      );
}
