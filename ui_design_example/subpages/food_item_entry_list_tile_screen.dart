import 'package:dartz/dartz.dart' hide State;
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry_list_tile.dart';
import 'package:esnya_shared_resources/core/utils/test_objects.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

class FoodItemEntryListTileScreen extends StatefulWidget {
  FoodItemEntryListTileScreen({Key? key}) : super(key: key);

  @override
  State<FoodItemEntryListTileScreen> createState() =>
      _FoodItemEntryListTileScreenState();
}

class _FoodItemEntryListTileScreenState
    extends State<FoodItemEntryListTileScreen> {
  BadgeDisplayMode badgeDisplayMode = BadgeDisplayMode.kcal;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = getColorScheme(context);

    List<FoodItemEntry> data = [
      TestObjects.foodItemEntrySuccess,
      TestObjects.foodItemEntrySuccess.copyWith(
        foodItem: TestObjects.foodItemEntrySuccess.foodItem.copyWith(
          amount: Amount(MeasureUnit.g, 234.34),
        ),
      ),
      TestObjects.foodItemEntrySuccess,
      TestObjects.foodItemEntrySemanticSuccess,
      TestObjects.foodItemEntrySemanticSuccessFailed,
    ];

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ...data
                    .map((e) => FoodItemEntryListTile(
                          foodItemEntry: e,
                          badgeDisplayMode: badgeDisplayMode,
                          onTap: () {
                            print("onTap");
                          },
                          onBadgeTap: () {
                            print("onBadgeTap");
                            setState(() {
                              badgeDisplayMode =
                                  badgeDisplayMode == BadgeDisplayMode.kcal
                                      ? BadgeDisplayMode.protein
                                      : BadgeDisplayMode.kcal;
                            });
                          },
                        ))
                    .map((e) => EsnyaSizes.paddingWrap(e))
              ],
            )));
  }
}
