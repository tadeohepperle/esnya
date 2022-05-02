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

class BigNutrientGoalDisplay extends StatelessWidget {
  final DailyNutrientTarget nutrientTarget;
  final Amount consumedAmount;
  BigNutrientGoalDisplay({
    Key? key,
    required this.nutrientTarget,
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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icon,
          size: 26,
          color: color,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: EsnyaSizes.base),
          child: Transform.translate(
            offset: Offset(0, 3),
            child: EsnyaText.h2(
              mainText,
              color: color,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -2),
          child: EsnyaText.titleBold(
            smallText,
            color: weakColor,
          ),
        ),
      ],
    );
  }
}
