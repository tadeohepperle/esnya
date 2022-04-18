import 'package:esnya/injection.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter/material.dart';

import '../../../domain/user_data/food_item_entry_bucket_repository.dart';

class FoodItemEntryDisplayTile extends StatelessWidget {
  final FoodItemEntry entry;
  final UniqueId? bucketId;
  const FoodItemEntryDisplayTile({Key? key, required this.entry, this.bucketId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return entry.map(
      semanticSuccess: (FoodItemEntrySemanticSuccess semanticSuccess) {
        return ListTile(
          tileColor: bucketId == null
              ? Color.fromARGB(255, 253, 200, 115)
              : Colors.white,
          title: Text(semanticSuccess.title + "    unknown kcal"),
          subtitle: Text(
            semanticSuccess.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          textColor: Colors.blueGrey,
          leading: bucketId != null
              ? ElevatedButton(
                  child: Icon(Icons.delete),
                  onPressed: () {
                    getIt<FoodItemEntryBucketRepository>()
                        .deleteEntry(bucketId!, entry);
                  },
                )
              : SizedBox.shrink(),
        );
      },
      success: (FoodItemEntrySuccess success) {
        return ListTile(
          tileColor: bucketId == null
              ? Color.fromARGB(255, 253, 200, 115)
              : Colors.white,
          title: Text(success.foodItem.food.title +
              "    " +
              success.foodItem.food.nutrients[NutrientType.energy].toString() +
              " kcal"),
          subtitle: Text(
            success.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
          textColor: Colors.blueGrey,
          leading: bucketId != null
              ? ElevatedButton(
                  child: Icon(Icons.delete),
                  onPressed: () {
                    getIt<FoodItemEntryBucketRepository>()
                        .deleteEntry(bucketId!, entry);
                  },
                )
              : SizedBox.shrink(),
        );
      },
    );
  }
}
