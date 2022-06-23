import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry/food_item_entry_failed_card.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry/food_item_entry_card.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/core/utils/test_objects.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class FoodItemEntryCardScreen extends StatefulWidget {
  const FoodItemEntryCardScreen({Key? key}) : super(key: key);

  @override
  State<FoodItemEntryCardScreen> createState() =>
      _FoodItemEntryCardScreenState();
}

class _FoodItemEntryCardScreenState extends State<FoodItemEntryCardScreen> {
  final foodItemEntry = TestObjects.foodItemEntry.copyWith.foodItem.food(
    nutrients: {
      NutrientType.protein: 9.8,
      NutrientType.energy: 540,
      NutrientType.carbs: 52,
      NutrientType.sugar: 42,
      NutrientType.fat: 32,
      NutrientType.fiber: 0.6,
      NutrientType.water: 1.2,
      NutrientType.vitc: 2.3,
      NutrientType.fatsat: 21,
    },
  );

  @override
  Widget build(BuildContext context) {
    print(foodItemEntry.foodItem.food.nutrients);
    return Scaffold(
      body: ListView(
        children: [
          EsnyaSizes.paddingWrap(
            FoodItemEntryCard(
              foodItemEntry: foodItemEntry,
              onAmountButtonClick: () {
                print("onAmountButtonClick");
              },
              onTimeButtonClick: () {
                print("onTimeButtonClick");
              },
              onDeleteButtonClick: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Text("alet");
                    });
              },
            ),
          ),
          Divider(
            height: 30,
          ),
          EsnyaSizes.paddingWrap(
            FoodItemEntryFailedCard(
              foodItemEntryFailed: TestObjectsX.foodItemEntryFailed,
              onAmountButtonClick: () {
                print("onAmountButtonClick");
              },
              onTimeButtonClick: () {
                print("onTimeButtonClick");
              },
              onCloseButtonClick: () {
                print("onCloseButtonClick");
              },
              onDeleteButtonClick: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Text("alet");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
