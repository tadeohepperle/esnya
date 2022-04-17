import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:kt_dart/collection.dart';

/// responsible for storing and serving buckets of food item entries. For example each day has its own bucket with logged foods.
abstract class FoodItemEntryBucketRepository extends SetupRepository {
  Stream<Either<Failure, KtList<FoodItemEntryBucket>>>
      watchLoggedBuckets(); // TODO: watch special time only

  FEFU addEntry(UniqueId bucketId, FoodItemEntry entry);
  FEFU addEntries(UniqueId bucketId, Iterable<FoodItemEntry> entries);
  FEFU updateEntry(UniqueId bucketId, FoodItemEntry entry);
  FEFU updateEntryFunctional(UniqueId bucketId, UniqueId entryId,
      FoodItemEntry Function(FoodItemEntry before) applyUpdate);
  FEFU deleteEntry(UniqueId bucketId, FoodItemEntry entry);

  FEFU addEntryToToday(FoodItemEntry entry);
  FEFU addEntriesToToday(Iterable<FoodItemEntry> entries);
  FEFU updateEntryInToday(FoodItemEntry entry);
  FEFU updateEntryFunctionalInToday(UniqueId entryId,
      FoodItemEntry Function(FoodItemEntry before) applyUpdate);
  FEFU deleteEntryFromToday(FoodItemEntry entry);
}


/*

Data Model in Firestore:

UserDocument:
  subcollection EntryBuckets:
    EntryBucket1:
      Type: EntryBucket.DailyLog
      Id: ....
      Tag: "2022-04-17"
      subcollection entries:























*/
