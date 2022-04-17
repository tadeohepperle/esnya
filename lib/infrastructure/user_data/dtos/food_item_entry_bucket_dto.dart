import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/core/models/user_data/food_item_entry_bucket.dart';

extension FoodItemEntryBucketDTO on FoodItemEntryBucket {
  static FoodItemEntryBucket fromFireStore(DocumentSnapshot doc) =>
      FoodItemEntryBucket.fromJson(doc.data() as Map<String, dynamic>)
          .copyWith(id: UniqueId.fromUniqueString(doc.id));

  Map<String, dynamic> toFireStore() {
    var json = toJson();
    json.remove(entries);
    json.remove(id);
    return json;
  }
}
