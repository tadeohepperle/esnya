import 'package:esnya/domain/user_data/user_diet_preferences_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter/material.dart';

import '../../design_components/esnya_button.dart';
import '../../design_components/esnya_icon_button.dart';
import '../../design_components/esnya_sizes.dart';
import 'big_nutrient_goal_display.dart';

class DashboardHeader extends StatelessWidget {
  final FoodItemEntryBucket bucket;
  final VoidCallback onCardTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onCalendarTap;
  const DashboardHeader({
    Key? key,
    required this.bucket,
    required this.onCardTap,
    required this.onSettingsTap,
    required this.onCalendarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final dietRepo = getIt<UserDietPreferencesRepository>();
    final nutrientAmounts = bucket.computedNutrientAmounts;

    final bigNutrientGoalDisplays = [
      for (NutrientType nutrientType in dietRepo.preferredNutrients) ...[
        BigNutrientGoalDisplay(
          nutrientTarget: dietRepo.getDailyTarget(nutrientType),
          consumedAmount: nutrientAmounts[nutrientType],
        ),
        SizedBox(
          height: 8,
        )
      ]
    ];
    bigNutrientGoalDisplays.removeLast();

    return shadowWrap(
      ShadowSize.small,
      EsnyaSizes.base * 2,
      MaterialButton(
        onPressed: onCardTap,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(EsnyaSizes.base * 3),
            bottomRight: Radius.circular(EsnyaSizes.base * 3),
          ),
          side: BorderSide.none,
        ),
        color: colorScheme.surface,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.fromLTRB(
              EsnyaSizes.base * 2, EsnyaSizes.base, EsnyaSizes.base * 2, 0),
          width: double.infinity,
          height: EsnyaSizes.kDashboardHeaderheightWithoutUnsafeArea,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EsynaButton.custom(
                    title: "Today, 24 Mar, 2022",
                    iconData: Icons.calendar_today,
                    onPressed: onCalendarTap,
                    shadowSize: ShadowSize.none,
                    getTextColor: (c) => c.onSurface,
                    customPadding:
                        EdgeInsets.only(top: 6, bottom: 6, right: 7, left: 7),
                    customPaddingBetweenIconAndText: 12,
                  ),
                  EsnyaIconButton.custom(
                    EsnyaIcons.settings,
                    onPressed: onSettingsTap,
                    shadowSize: ShadowSize.none,
                    customIconSize: 24,
                    getIconColor: (c) => c.onSurface,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    ...bigNutrientGoalDisplays,
                  ],
                ),
              ),
              Center(
                child: Transform.translate(
                  offset: Offset(0, 6),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: colorScheme.onBackground,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
