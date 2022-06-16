import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/widgets/dashboard_header/big_nutrient_goal_display.dart';
import 'package:flutter/material.dart';

class DashboardHeaderScreen extends StatelessWidget {
  const DashboardHeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EsynaButton.surface(
                  title: "Today, 24 Mar, 2022",
                  trailingIcon: Icons.calendar_today,
                  onPressed: () {},
                ),
                EsnyaIconButton.surface(
                  EsnyaIcons.settings,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 8,
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
    );
  }
}
