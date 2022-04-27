import 'package:dartz/dartz.dart' hide State;
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya_shared_resources/core/conversion/measure_unit_conversion.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../design_components/esnya_design_utils.dart';

class NutrientTable extends StatelessWidget {
  final NutrientTableState state;
  NutrientTable({
    Key? key,
    required Map<NutrientType, Amount> nutrientAmounts,
    required Iterable<NutrientType> nutrientTypes,
  })  : state = NutrientTableState.fromFoodItemAndNutrientTypes(
            nutrientAmounts: nutrientAmounts, nutrientTypes: nutrientTypes),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);

    final LanguageRepository langRepo = getIt<LanguageRepository>();
    num _sumOfPreviousGramEquivalents = 0;
    _buildRow(RowInformation rowInfo) {
      final amount = rowInfo.amount.roundPlaces(1);
      final gramEquivalent = rowInfo.gramEquivalent;
      final isHighest = gramEquivalent == state.highestGramEquivalent;
      final nutrientType = rowInfo.nutrientType;
      final percent100 = state.highestGramEquivalent;
      final gramProportion =
          state.totalGrams > 0 ? gramEquivalent / percent100 : 1;
      final previousGramsProportion =
          percent100 > 0 ? _sumOfPreviousGramEquivalents / percent100 : 0;
      //HINT: Disable this line to get a left aligned bar plot
      // _sumOfPreviousGramEquivalents += gramEquivalent;

      int gramProportionInt = (gramProportion * 100).round();
      int previousGramsProportionInt = (previousGramsProportion * 100).round();
      int leftOverProportion =
          100 - gramProportionInt - previousGramsProportionInt;

      final color = isHighest ? colorScheme.primary : colorScheme.onSurface;
      return Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Icon(
                EsnyaIcons.nutrientIcons[nutrientType] ??
                    EsnyaIcons.placeholder,
                color: color,
                size: 16,
              ),
              EsnyaSizes.spaceBaseWidth2,
              Expanded(
                  child: EsnyaText.titleBold(
                langRepo.translateNutrientType(nutrientType).toTitleCase(),
                color: color,
              )),
              EsnyaText.titleBold(
                langRepo.translateAmount(amount, fractionDigits: 1),
                color: color,
              ),
            ],
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
            // TODO: distingish between 0 grams and content not null, make grams a nullable type.
            child: Row(
              children: [
                Expanded(
                    flex: previousGramsProportionInt,
                    child: Container(
                      height: 24,
                    )),
                Expanded(
                    flex: gramProportionInt,
                    child: Container(
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: color,
                      ),
                    )),
                Expanded(
                  flex: leftOverProportion,
                  child: Container(
                    height: 24,
                  ),
                ),
              ],
            ),
          )),
        ],
      );
    }

    return Column(
      children: [...state.rowInformations.map((rowInfo) => _buildRow(rowInfo))],
    );
  }
}

const zeroAmount = Amount(MeasureUnit.g, 0);

class NutrientTableState {
  final double totalGrams;
  final double highestGramEquivalent;
  final List<RowInformation> rowInformations;
  factory NutrientTableState.fromFoodItemAndNutrientTypes({
    required Map<NutrientType, Amount> nutrientAmounts,
    required Iterable<NutrientType> nutrientTypes,
  }) {
    double totalGrams = 0;
    double highestGramEquivalent = 0;
    final rowInformations = nutrientTypes.map((nType) {
      final amount = nutrientAmounts[nType];
      if (amount == null) {
        return RowInformation.emptyFromNutrientType(nType);
      }
      final gramEquivalent = convertAmountToMeasureUnit(amount, MeasureUnit.g)
          .fold((l) => 0.0, (r) => r.number);
      if (gramEquivalent > highestGramEquivalent) {
        highestGramEquivalent = gramEquivalent;
      }
      totalGrams += gramEquivalent;
      return RowInformation(
          gramEquivalent: gramEquivalent, amount: amount, nutrientType: nType);
    }).toList();

    return NutrientTableState(
        totalGrams: totalGrams,
        highestGramEquivalent: highestGramEquivalent,
        rowInformations: rowInformations);
  }

  NutrientTableState(
      {required this.totalGrams,
      required this.highestGramEquivalent,
      required this.rowInformations});
}

class RowInformation {
  final double gramEquivalent;
  final Amount amount;
  final NutrientType nutrientType;
  RowInformation({
    required this.gramEquivalent,
    required this.amount,
    required this.nutrientType,
  });

  factory RowInformation.emptyFromNutrientType(NutrientType nutrientType) =>
      RowInformation(
        gramEquivalent: 0,
        amount: zeroAmount,
        nutrientType: nutrientType,
      );

  @override
  String toString() {
    return 'RowInformation($gramEquivalent, $amount, $nutrientType)';
  }
}
