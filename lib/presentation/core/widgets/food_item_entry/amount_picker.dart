import 'package:dartz/dartz.dart' hide State;
import 'package:esnya/domain/core/utils.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/design_components/esnya_dropdown_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_text_field.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry/buttons_above_card.dart';
import 'package:esnya/presentation/core/widgets/utils/decimal_text_input_formatter.dart';
import 'package:esnya_shared_resources/core/conversion/measure_unit_conversion.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';

class AmountPicker extends StatefulWidget {
  final FoodItemEntry foodItemEntry;
  const AmountPicker({
    Key? key,
    required this.foodItemEntry,
  }) : super(key: key);

  @override
  State<AmountPicker> createState() => _AmountPickerState();
}

class _AmountPickerState extends State<AmountPicker> {
  late Amount selectedAmount;
  String errorText = "";
  late TextEditingController textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedAmount = widget.foodItemEntry.foodItem.amount;
    textController =
        TextEditingController(text: selectedAmount.number.toRoundedString());
  }

  Tuple2<List<MeasureUnit>, Map<MeasureUnit, Amount?>>
      _getValidMeasureUnitsAndGrams() {
    final foodMeasures = widget.foodItemEntry.foodItem.food.measures;
    final allMeasures = [
      selectedAmount.unit,
      MeasureUnit.g,
      MeasureUnit.oz,
      MeasureUnit.ml,
      MeasureUnit.tsp,
      MeasureUnit.tbsp,
      MeasureUnit.cup,
      MeasureUnit.kcal,
      MeasureUnit.kJ,
      ...foodMeasures.keys
    ].unique();

    final gramMap = {
      for (var m in allMeasures)
        m: convertAmountToMeasureUnit(
          Amount(m, 1),
          MeasureUnit.g,
          food: widget.foodItemEntry.foodItem.food,
        ).toOption().toNullable()
    };
    return Tuple2(allMeasures, gramMap);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final langRepo = getIt<LanguageRepository>();

    final measureUnitsAndGrams = _getValidMeasureUnitsAndGrams();
    final allMeasures = measureUnitsAndGrams.value1;
    final gramMap = measureUnitsAndGrams.value2;

    final selectedAmountTitle = langRepo.translateAmount(selectedAmount);

    String constructMeasureUnitTitle(MeasureUnit m) {
      final t = langRepo.translateMeasureUnit(m);
      final q = langRepo.translateAmount(
        gramMap[m]!,
      );
      return '$t ($q)';
    }

    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonsAboveCard(
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
              mainAxisSize: MainAxisSize.min,
              children: [
                EsnyaText.h2(
                  "Change Amount",
                  color: colorScheme.primary,
                ),
                EsnyaSizes.spaceBaseHeight,
                EsnyaText.titleBold(
                  'For "${widget.foodItemEntry.foodMappingObject.title}"',
                  color: colorScheme.onBackground,
                ),
                const SizedBox(
                  height: 24,
                ),
                Material(
                  color: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 48,
                        child: EsnyaTextField(
                            controller: textController,
                            inputFormatters: [doubleInputFormatter],
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            onChanged: (t) {
                              final asDouble = double.tryParse(t);
                              if (asDouble != null) {
                                if (asDouble == 0) {
                                  setState(() {
                                    errorText = "Amount cannot be 0!";
                                  });
                                } else {
                                  final newAmount =
                                      selectedAmount.copyWith(number: asDouble);
                                  setState(() {
                                    errorText = "";
                                    selectedAmount = newAmount;
                                  });
                                }
                              }
                            }),
                      ),
                      EsnyaSizes.spaceBaseWidth2,
                      EsnyaDropdownButton<MeasureUnit>(
                        // TODO: only measure units available for food item. for example not 1 clove for an energy drink
                        items: allMeasures,
                        mapItemToDisplayedString: (m) =>
                            constructMeasureUnitTitle(m),

                        onChanged: (val) {
                          if (val != null) {
                            final newAmount =
                                selectedAmount.copyWith(unit: val);
                            setState(() {
                              selectedAmount = newAmount;
                            });
                          }
                        },
                        value: selectedAmount.unit,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                EsynaButton.primary(
                  title: 'Save "$selectedAmountTitle"',
                  leadingIcon: EsnyaIcons.check,
                  buttonSize: ButtonSize.large,
                  onPressed: errorText.isNotEmpty
                      ? null
                      : () async {
                          if (errorText == "") {
                            Navigator.of(context).pop<Amount>(selectedAmount);
                          }
                        },
                ),
                EsnyaSizes.spaceBaseHeight,
                if (errorText.isNotEmpty)
                  EsnyaText.title(
                    errorText,
                    color: colorScheme.error,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
