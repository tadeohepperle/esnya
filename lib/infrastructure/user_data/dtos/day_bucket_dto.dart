import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya_shared_resources/core/core.dart';

extension DayBucketDTO on DayBucket {
  static DayBucket fromFireStore(DocumentSnapshot docSnapshot) {
    return DayBucket.fromJson(docSnapshot.data() as Map<String, dynamic>)
        .copyWith(id: UniqueId.fromUniqueString(docSnapshot.id));
  }

  Map<String, dynamic> toFireStore() {
    return toJson();
  }
}
