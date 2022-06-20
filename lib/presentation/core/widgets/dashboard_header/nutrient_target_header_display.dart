import 'package:esnya/domain/user_data/entities/daily_nutrient_target.dart';
import 'package:esnya/domain/user_data/user_diet_preferences_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';

class NutrientTargetHeaderDisplay extends StatelessWidget {
  final DailyNutrientTarget nutrientTarget;
  final Amount consumedAmount;
  final double horizontalPadding;
  NutrientTargetHeaderDisplay({
    Key? key,
    required this.nutrientTarget,
    this.horizontalPadding = 3,
    Amount? consumedAmount,
  })  : consumedAmount =
            consumedAmount ?? Amount(nutrientTarget.nutrientType.unit, 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final langRepo = getIt<LanguageRepository>();

    final colorScheme = getColorScheme(context);
    final color = mapNutrientToColor(nutrientTarget.nutrientType, colorScheme);
    final weakColor = consumedAmount.unit == nutrientTarget.amount.unit &&
            consumedAmount.number >= nutrientTarget.amount.number
        ? color
        : colorScheme.onBackground;
    final icon = EsnyaIcons.mapNutrientToIcon(nutrientTarget.nutrientType);
    final mainText = langRepo.translateAmount(
      consumedAmount,
      fractionDigits: 0,
    );

    String smallText = "/ " +
        langRepo.translateAmount(nutrientTarget.amount, fractionDigits: 0);
    if (nutrientTarget.nutrientType != NutrientType.energy) {
      smallText +=
          " " + langRepo.translateNutrientType(nutrientTarget.nutrientType);
    }

    final consumedFractionInPercent =
        (consumedAmount.number / nutrientTarget.amount.number * 100)
            .round()
            .clamp(0, 100);
    print(consumedFractionInPercent);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Transform.translate(
                offset: Offset(0, -6),
                child: Icon(
                  icon,
                  size: 26,
                  color: color,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: EsnyaSizes.base),
                child: EsnyaText.h1(
                  mainText,
                  color: color,
                ),
              ),
              Transform.translate(
                offset: Offset(0, -5),
                child: EsnyaText.titleBold(
                  smallText,
                  color: weakColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.onSurfaceVariant,
              borderRadius: EsnyaSizes.borderRadius,
            ),
            child: Row(children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: EsnyaSizes.borderRadius,
                  ),
                  height: 8,
                ),
                flex: consumedFractionInPercent,
              ),
              Flexible(
                child: SizedBox.shrink(),
                flex: 100 - consumedFractionInPercent,
              )
            ]),
          )
        ],
      ),
    );
  }
}
