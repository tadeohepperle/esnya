import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/utils.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:kt_dart/collection.dart';

/// responsible for storing and serving buckets of food item entries. For example each day has its own bucket with logged foods.
abstract class DayBucketsRepository extends SetupRepository {
  Future<Either<Failure, Unit>> createBucket(DayBucket bucket);
  Future<Either<Failure, Unit>> updateBucket(DayBucket bucket);
  Future<Either<Failure, Unit>> deleteBucket(DayBucket bucket);

  Stream<Either<Failure, DayBucket>> watchBucket(UniqueId bucketId);
  Stream<Either<Failure, KtList<DayBucket>>> watchLogBuckets({
    required int batchSize,
  });

  Future<Either<Failure, Unit>> createEntry(
      UniqueId bucketId, FoodItemEntry entry);
  Future<Either<Failure, Unit>> createEntries(
      UniqueId bucketId, Iterable<FoodItemEntry> entries);
  Future<Either<Failure, Unit>> updateEntry(
      UniqueId bucketId, FoodItemEntry entry);
  Future<Either<Failure, Unit>> updateEntryFunctional(UniqueId bucketId,
      UniqueId entryId, MapFunction<FoodItemEntry> applyUpdate);
  Future<Either<Failure, Unit>> deleteEntry(
      UniqueId bucketId, FoodItemEntry entry);

  Future<Either<Failure, Unit>> createEntryForToday(FoodItemEntry entry);
  Future<Either<Failure, Unit>> createEntriesForToday(
      Iterable<FoodItemEntry> entries);
  Future<Either<Failure, Unit>> updateEntryForToday(FoodItemEntry entry);
  Future<Either<Failure, Unit>> updateEntryFunctionalForToday(
      UniqueId entryId, MapFunction<FoodItemEntry> applyUpdate);
  Future<Either<Failure, Unit>> deleteEntryForToday(FoodItemEntry entry);
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
