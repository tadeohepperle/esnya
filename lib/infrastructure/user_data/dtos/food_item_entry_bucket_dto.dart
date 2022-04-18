import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya_shared_resources/core/core.dart';

extension FoodItemEntryBucketDTO on FoodItemEntryBucket {
  static FoodItemEntryBucket fromFireStore(DocumentSnapshot doc) =>
      FoodItemEntryBucket.fromJson(doc.data() as Map<String, dynamic>)
          .copyWith(id: UniqueId.fromUniqueString(doc.id));

  Map<String, dynamic> toFireStore() {
    var json = toJson();
    json.remove("id");
    return json;
  }
}
