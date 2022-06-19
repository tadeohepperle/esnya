import 'package:dartz/dartz.dart' hide State;
import 'package:esnya/application/food_data/input/models/food_item_entry_wrapper.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/widgets/bucket_date_title_list_item.dart';
import 'package:esnya/presentation/core/widgets/list_tiles/food_item_entry_failed_list_tile.dart';
import 'package:esnya/presentation/core/widgets/list_tiles/food_item_entry_list_tile.dart';
import 'package:esnya/presentation/core/widgets/list_tiles/food_item_entry_processing_list_tile.dart';
import 'package:esnya/presentation/core/widgets/list_tiles/no_entries_yet_list_item.dart';
import 'package:esnya_shared_resources/core/utils/test_objects.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class FoodItemEntryListTileScreen extends StatefulWidget {
  FoodItemEntryListTileScreen({Key? key}) : super(key: key);

  @override
  State<FoodItemEntryListTileScreen> createState() =>
      _FoodItemEntryListTileScreenState();
}

class _FoodItemEntryListTileScreenState
    extends State<FoodItemEntryListTileScreen> {
  NutrientType badgeNutrient = NutrientType.energy;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = getColorScheme(context);

    final success = TestObjects.foodItemEntry.copyWith(
      foodItem: TestObjects.foodItemEntry.foodItem.copyWith(
        amount: Amount(MeasureUnit.can, 234.34),
      ),
    );
    List<FoodItemEntryWrapper> data = [
      FoodItemEntryWrapper.success(TestObjects.foodItemEntry),
      FoodItemEntryWrapper.success(
        TestObjects.foodItemEntry.copyWith.foodItem
            .amount(unit: MeasureUnit.handful, number: 2),
      ),
      TestObjectsX.foodItemEntryProcessing,
      TestObjectsX.foodItemEntryFailed,
    ];

    final dateToday = DateTime.now();
    final todayBucketId = UniqueId.fromUniqueString(
        '${dateToday.year}-${dateToday.month}-${dateToday.day}');
    print(todayBucketId);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            BucketDateTitleListItem(
              bucket: TestObjects.foodItemEntryBucket,
            ),
            FoodItemEntryListTile(
              foodItemEntry: TestObjects.foodItemEntry,
              badgeNutrient: badgeNutrient,
              onTap: () {
                print("onTap");
              },
              onBadgeTap: () {
                print("onBadgeTap");
                setState(() {
                  badgeNutrient = badgeNutrient == NutrientType.energy
                      ? NutrientType.protein
                      : NutrientType.energy;
                });
              },
            ),
            SizedBox(
              height: 4,
            ),
            FoodItemEntryListTile(
              foodItemEntry: TestObjects.foodItemEntry,
              badgeNutrient: badgeNutrient,
              onTap: () {
                print("onTap");
              },
              onBadgeTap: () {
                print("onBadgeTap");
                setState(() {
                  badgeNutrient = badgeNutrient == NutrientType.energy
                      ? NutrientType.protein
                      : NutrientType.energy;
                });
              },
            ),
            SizedBox(
              height: 4,
            ),
            FoodItemEntryFailedListTile(
              failed: FoodItemEntryFailed(
                  amount: Amount(MeasureUnit.cup, 4),
                  uniqueId: UniqueId(),
                  dateTime: DateTime.now(),
                  inputFoodName: "cubumdnnsd"),
              badgeNutrient: badgeNutrient,
              onTap: () {
                print("onTap");
              },
              onDismissed: (_) {
                print("Dismissed!!");
              },
            ),
            SizedBox(
              height: 4,
            ),
            FoodItemEntryProcessingListTile(
              processing: FoodItemEntryFailed(
                  amount: Amount(MeasureUnit.g, 320),
                  uniqueId: UniqueId(),
                  dateTime: DateTime.now(),
                  inputFoodName: "applesauce"),
              badgeNutrient: badgeNutrient,
              onTap: () {
                print("onTap");
              },
              onBadgeTap: () {
                print("onBadgeTap");
                setState(() {
                  badgeNutrient = badgeNutrient == NutrientType.energy
                      ? NutrientType.protein
                      : NutrientType.energy;
                });
              },
            ),
            Divider(),
            NoEntriesYetListItem(),
          ],
        ),
      ),
    );
  }
}
