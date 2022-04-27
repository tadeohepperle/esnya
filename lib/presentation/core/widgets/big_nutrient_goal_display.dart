import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';

class BigNutrientGoalDisplay extends StatelessWidget {
  final IconData iconData;
  final GetColor? getColor;
  final String largeText;
  final String smallText;
  const BigNutrientGoalDisplay({
    Key? key,
    this.iconData = EsnyaIcons.energy,
    this.largeText = '1365 kcal',
    this.smallText = '/ 2300 kcal',
    this.getColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final c = getColor != null ? getColor!(colorScheme) : colorScheme.primary;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          iconData,
          size: 34,
          color: c,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: EsnyaSizes.base),
          child: Transform.translate(
            offset: Offset(0, 3),
            child: EsnyaText.h1(
              largeText,
              color: c,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -2),
          child: EsnyaText.titleBold(
            smallText,
            color: colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
