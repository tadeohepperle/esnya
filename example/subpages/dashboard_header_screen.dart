import 'package:esnya/presentation/core/design_components/big_nutrient_goal_display.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:flutter/material.dart';

class DashboardHeaderScreen extends StatelessWidget {
  const DashboardHeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shadowWrapLarge(
        Container(
          padding: EdgeInsets.all(EsnyaSizes.base * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(EsnyaSizes.base * 3),
              bottomRight: const Radius.circular(EsnyaSizes.base * 3),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text("Hello Tadeo, this is your day in numbers"),
              // SizedBox(
              //   height: 24,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EsynaButton.custom(
                    title: "Today, 24 Mar, 2022",
                    iconData: Icons.calendar_today,
                    onPressed: () {},
                    shadowSize: ShadowSize.none,
                    customPadding:
                        EdgeInsets.only(top: 6, bottom: 6, right: 7, left: 7),
                    customPaddingBetweenIconAndText: 16,
                  ),
                  EsnyaIconButton.custom(
                    Icons.settings,
                    onPressed: () {},
                    shadowSize: ShadowSize.none,
                    customIconSize: 24,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BigNutrientGoalDisplay(
                getColor: (c) => c.secondary,
                iconData: Icons.invert_colors,
                largeText: '1235 kcal',
                smallText: '/ 2300 kcal',
              ),
              SizedBox(
                height: 8,
              ),
              BigNutrientGoalDisplay(
                iconData: Icons.icecream,
                largeText: '43 g',
                smallText: '/ 120 g Protein',
              ),
              Center(
                child: Transform.translate(
                  offset: Offset(0, 16),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: esnyaColorsLight.textTertiary,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
