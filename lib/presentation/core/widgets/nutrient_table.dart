import 'package:esnya_shared_resources/core/conversion/measure_unit_conversion.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../../../injection.dart';
import '../design_components/esnya_design_utils.dart';
import '../design_components/esnya_icons.dart';
import '../design_components/esnya_sizes.dart';
import '../design_components/esnya_text.dart';

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

    Widget _buildBar(double gramEquivalent,
        {double? subNutrientGramEquivalent,
        VoidCallback? onTap,
        NutrientType? subNutrient}) {
      assert(subNutrientGramEquivalent == null ||
          subNutrientGramEquivalent <= gramEquivalent);

      final color = colorScheme.onSurface;
      final subColor = colorScheme.error;
      final gramProportion100 = state.highestGramEquivalent > 0
          ? 100 * gramEquivalent / state.highestGramEquivalent
          : 0;

      // some constant threshhold, fraction of max bar length
      final showSubNutrientTitle = subNutrientGramEquivalent != null
          ? subNutrientGramEquivalent / state.highestGramEquivalent > 0.3
          : false;
      final subRow = subNutrientGramEquivalent == null
          ? null
          : Row(
              children: [
                Expanded(
                  flex: (subNutrientGramEquivalent / gramEquivalent * 100)
                      .round(),
                  child: Container(
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: subColor,
                    ),
                    child: showSubNutrientTitle
                        ? Align(
                            alignment: Alignment.topCenter,
                            child: EsnyaText.body(
                              langRepo.translateNutrientType(subNutrient!),
                              color: colorScheme.onSurface,
                            ),
                          )
                        : null,
                  ),
                ),
                Expanded(
                  flex: 100 -
                      (subNutrientGramEquivalent / gramEquivalent * 100)
                          .round(),
                  child: Container(
                    height: 24,
                  ),
                )
              ],
            );

      return Row(
        children: [
          Expanded(
            flex: gramProportion100.round(),
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: color,
              ),
              child: subRow,
            ),
          ),
          Expanded(
            flex: 100 - gramProportion100.round(),
            child: Container(
              height: 24,
            ),
          ),
        ],
      );
    }

    Row _buildRow(RowInformation rowInfo) {
      final color = colorScheme.onSurface;
      //color = isHighest ? colorScheme.primary : colorScheme.onSurface;
      final gramEquivalent = rowInfo.gramEquivalent;
      // final isHighest = gramEquivalent == state.highestGramEquivalent;
      final nutrientType = rowInfo.nutrientType;

      NutrientType? subNutrient = {
        NutrientType.carbs: NutrientType.sugar,
        NutrientType.fat: NutrientType.fatsat,
      }[rowInfo.nutrientType];

      final subNutrientGramEquivalent = subNutrient == null
          ? null
          : state.rowInformationsSubNutrients[subNutrient]!.gramEquivalent;
      final String amountTitle = (rowInfo.amount == null)
          ? "unknown"
          : langRepo.translateAmount(rowInfo.amount!.roundPlaces(1),
              fractionDigits: 1);

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
                  ),
                ),
                EsnyaText.titleBold(
                  amountTitle,
                  color: color,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
              // TODO: distingish between 0 grams and content not null, make grams a nullable type.
              child: rowInfo.gramEquivalent == null
                  ? SizedBox.shrink()
                  : _buildBar(
                      rowInfo.gramEquivalent!,
                      subNutrientGramEquivalent: subNutrientGramEquivalent,
                      subNutrient: subNutrient,
                    ),
            ),
          ),
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
  final Map<NutrientType, RowInformation> rowInformationsSubNutrients;
  factory NutrientTableState.fromFoodItemAndNutrientTypes({
    required Map<NutrientType, Amount> nutrientAmounts,
    required Iterable<NutrientType> nutrientTypes,
  }) {
    double totalGrams = 0;
    double highestGramEquivalent = 0;

    RowInformation _computeRowInfo(NutrientType nType) {
      final amount = nutrientAmounts[nType];
      if (amount == null) {
        return RowInformation(
            amount: null, gramEquivalent: null, nutrientType: nType);
      }
      final gramEquivalent = convertAmountToMeasureUnit(amount, MeasureUnit.g)
          .fold((l) => null, (r) => r.number);
      if (gramEquivalent == null) {
        return RowInformation(
            amount: null, gramEquivalent: null, nutrientType: nType);
      }
      if (gramEquivalent > highestGramEquivalent) {
        highestGramEquivalent = gramEquivalent;
      }
      return RowInformation(
          gramEquivalent: gramEquivalent, amount: amount, nutrientType: nType);
    }

    final rowInformations = nutrientTypes.map((nType) {
      final rowInfo = _computeRowInfo(nType);
      totalGrams += rowInfo.gramEquivalent ?? 0;
      return rowInfo;
    }).toList();

    final subNutr = {NutrientType.sugar: null, NutrientType.fatsat: null}.map(
      (nType, _) => MapEntry(
        nType,
        _computeRowInfo(nType),
      ),
    );

    return NutrientTableState(
      totalGrams: totalGrams,
      highestGramEquivalent: highestGramEquivalent,
      rowInformations: rowInformations,
      rowInformationsSubNutrients: subNutr,
    );
  }

  NutrientTableState({
    required this.totalGrams,
    required this.highestGramEquivalent,
    required this.rowInformations,
    required this.rowInformationsSubNutrients,
  });
}

class RowInformation {
  final double? gramEquivalent;
  final Amount? amount;
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
