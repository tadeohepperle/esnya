import 'package:dartz/dartz.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya/presentation/core/design_components/utils/grid_overlay.dart';
import 'package:esnya/presentation/core/widgets/dashboard_header/dashboard_header.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter/material.dart';

class DashboardHeaderScreen extends StatelessWidget {
  const DashboardHeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorScheme(context).surface,
      body: GridOverlay(
        DashboardHeader(
          bucket: TestObjects.foodItemEntryBucket,
          onCardTap: () {},
          onCalendarTap: () {},
        ),
      ),
    );
  }
}
