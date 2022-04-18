import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya_shared_resources/core/core.dart';

extension FoodItemEntryBucketDTO on FoodItemEntryBucket {
  static FoodItemEntryBucket fromFireStore(DocumentSnapshot docSnapshot) =>
      FoodItemEntryBucket.fromJson(docSnapshot.data() as Map<String, dynamic>)
          .copyWith(id: UniqueId.fromUniqueString(docSnapshot.id));

  Map<String, dynamic> toFireStore() {
    var json = toJson();
    return json;
  }
}
