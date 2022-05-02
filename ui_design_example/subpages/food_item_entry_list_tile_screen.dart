import 'package:dartz/dartz.dart' hide State;
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/widgets/bucket_date_title_list_item.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry_list_tile.dart';
import 'package:esnya/presentation/core/widgets/no_entries_yet_list_item.dart';
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
  NutrientType badgeNutrient = NutrientType.energy;
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
          amount: Amount(MeasureUnit.can, 234.34),
        ),
      ),
      TestObjects.foodItemEntrySuccess.copyWith.foodItem
          .amount(unit: MeasureUnit.handful, number: 2),
      TestObjects.foodItemEntrySemanticSuccess,
      TestObjects.foodItemEntrySemanticSuccessFailed,
    ];

    final dateToday = DateTime.now();
    final todayBucketId = UniqueId.fromUniqueString(
        'log-${dateToday.year}-${dateToday.month}-${dateToday.day}');
    print(todayBucketId);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                BucketDateTitleListItem(
                  bucket: TestObjects.foodItemEntryBucket.copyWith(
                    id: UniqueId.fromUniqueString("log-2022-04-07"),
                  ),
                ),
                ...data
                    .map((e) => FoodItemEntryListTile(
                          foodItemEntry: e,
                          badgeNutrient: badgeNutrient,
                          onTap: () {
                            print("onTap");
                          },
                          onBadgeTap: () {
                            print("onBadgeTap");
                            setState(() {
                              badgeNutrient =
                                  badgeNutrient == NutrientType.energy
                                      ? NutrientType.protein
                                      : NutrientType.energy;
                            });
                          },
                        ))
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(
                              bottom: EsnyaSizes
                                  .kFoodItemEntryListTilePaddingBelow),
                          child: e,
                        )),
                BucketDateTitleListItem(
                  bucket: TestObjects.foodItemEntryBucket.copyWith(
                    id: todayBucketId,
                  ),
                ),
                NoEntriesYetListItem(),
              ],
            )));
  }
}
