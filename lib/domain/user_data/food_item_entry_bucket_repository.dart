import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:kt_dart/collection.dart';

/// responsible for storing and serving buckets of food item entries. For example each day has its own bucket with logged foods.
abstract class FoodItemEntryBucketRepository extends SetupRepository {
  Stream<Either<Failure, KtList<FoodItemEntryBucket>>>
      watchLoggedBuckets(); // TODO: watch special time only

  Future<Either<Failure, Unit>> createBucket(FoodItemEntryBucket bucket);
  Future<Either<Failure, Unit>> updateBucket(FoodItemEntryBucket bucket);
  Future<Either<Failure, Unit>> deleteBucket(FoodItemEntryBucket bucket);

  Future<Either<Failure, Unit>> createEntry(
      UniqueId bucketId, FoodItemEntry entry);
  Future<Either<Failure, Unit>> createEntries(
      UniqueId bucketId, Iterable<FoodItemEntry> entries);
  Future<Either<Failure, Unit>> updateEntry(
      UniqueId bucketId, FoodItemEntry entry);
  Future<Either<Failure, Unit>> updateEntryFunctional(
      UniqueId bucketId,
      UniqueId entryId,
      FoodItemEntry Function(FoodItemEntry before) applyUpdate);
  Future<Either<Failure, Unit>> deleteEntry(
      UniqueId bucketId, FoodItemEntry entry);

  Future<Either<Failure, Unit>> createEntryToToday(FoodItemEntry entry);
  Future<Either<Failure, Unit>> createEntriesToToday(
      Iterable<FoodItemEntry> entries);
  Future<Either<Failure, Unit>> updateEntryInToday(FoodItemEntry entry);
  Future<Either<Failure, Unit>> updateEntryFunctionalInToday(UniqueId entryId,
      FoodItemEntry Function(FoodItemEntry before) applyUpdate);
  Future<Either<Failure, Unit>> deleteEntryFromToday(FoodItemEntry entry);
}


/*

Data Model in Firebase:

UserDocument:
  subcollection EntryBuckets:
    EntryBucket1:
      Type: EntryBucket.DailyLog
      Id: ....
      Tag: "2022-04-17"
      subcollection entries:























*/
