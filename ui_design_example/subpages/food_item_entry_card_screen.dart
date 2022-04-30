import 'package:esnya/presentation/core/widgets/food_item_entry_success_card.dart';
import 'package:esnya_shared_resources/core/utils/test_objects.dart';
import 'package:flutter/material.dart';

class FoodItemEntryCardScreen extends StatefulWidget {
  const FoodItemEntryCardScreen({Key? key}) : super(key: key);

  @override
  State<FoodItemEntryCardScreen> createState() =>
      _FoodItemEntryCardScreenState();
}

class _FoodItemEntryCardScreenState extends State<FoodItemEntryCardScreen> {
  final foodItemEntry = TestObjects.foodItemEntrySuccess
      .copyWith(foodItem: TestObjects.foodItem2);

  @override
  Widget build(BuildContext context) {
    print(foodItemEntry.foodItem.food.nutrients);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: FoodItemEntrySuccessCard(
          foodItemEntry: foodItemEntry,
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
                });
          }),
    ));
  }
}
