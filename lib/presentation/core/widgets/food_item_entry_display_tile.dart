import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter/material.dart';

class FoodItemEntryDisplayTile extends StatelessWidget {
  final FoodItemEntry entry;
  const FoodItemEntryDisplayTile({Key? key, required this.entry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return entry.map(
      preSuccess: (FoodItemEntryPreSuccess preSuccess) {
        return Container(
          decoration: BoxDecoration(border: Border.all(width: 3)),
          padding: EdgeInsets.all(5),
          child: Text(preSuccess.amount.number.toString() +
              " x  " +
              preSuccess.amount.unit.baseUnitEquivalent.toString() +
              "   " +
              preSuccess.title),
        );
      },
      success: (FoodItemEntrySuccess success) {
        return Text("success " + success.title);
      },
    );
  }
}
