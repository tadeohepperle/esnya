import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter/material.dart';

class FoodItemEntryDisplayTile extends StatelessWidget {
  final FoodItemEntry entry;
  const FoodItemEntryDisplayTile({Key? key, required this.entry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (entry is FoodItemEntryPreSuccess) {
      final e = entry as FoodItemEntryPreSuccess;
      return Container(
        decoration: BoxDecoration(border: Border.all(width: 3)),
        padding: EdgeInsets.all(5),
        child: Text(e.amount.number.toString() +
            " x  " +
            e.amount.unit.baseUnitEquivalent.toString() +
            "   " +
            e.title),
      );
    }
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 3)),
      padding: EdgeInsets.all(5),
      child: Text(entry.title),
    );
  }
}
