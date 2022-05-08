import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:kt_dart/kt.dart';

const int kSecondsUntilALoadingEntryIsTranformedToFailed = 30;

extension FoodItemEntryBucketDTO on FoodItemEntryBucket {
  static FoodItemEntryBucket fromFireStore(DocumentSnapshot docSnapshot) {
    final bucket =
        FoodItemEntryBucket.fromJson(docSnapshot.data() as Map<String, dynamic>)
            .copyWith(id: UniqueId.fromUniqueString(docSnapshot.id));

    /// every entry that is loading is transformed into a failed one, if item creation was long ago.
    /// this might be too janky or too caluclation intensive. But at least it gets rid of loading items in the UI
    final entriesWithoutOldLoadingEntries = bucket.entries.iter.map((e) {
      if (e.map(
          semanticSuccess: (s) =>
              !s.mappingFailed &&
              DateTime.now().difference(s.dateTime).inSeconds > 10,
          success: (s) => false)) {
        return e.toMappingFailed();
      } else {
        return e;
      }
    });

    return bucket.copyWith(
        entries: entriesWithoutOldLoadingEntries.toImmutableList());
  }

  Map<String, dynamic> toFireStore() {
    var json = toJson();
    return json;
  }
}
