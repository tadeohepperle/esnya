import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya/domain/core/utils.dart';
import 'package:esnya/infrastructure/core/firestore_helpers.dart';
import 'package:esnya/infrastructure/user_data/dtos/day_bucket_dto.dart';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya/domain/user_data/day_bucket_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:loggy/loggy.dart';
import 'package:rxdart/rxdart.dart';

import 'utils/food_item_entry_bucket_utils.dart';

/// buckets are saved under collection: user/useridxyz/buckets

@isolate1
@LazySingleton(as: DayBucketsRepository)
class DayBucketRepositoryImplFirebase extends SetupRepositoryImpl
    implements DayBucketsRepository {
  final FirebaseFirestore _firestore;

  DayBucketRepositoryImplFirebase(this._firestore) {}

  ///////////////////////////////////
  /// Bucket operations:
  ///////////////////////////////////

  /// create bucket and all entries in its subcollection:
  @override
  Future<Either<Failure, Unit>> createBucket(DayBucket bucket) =>
      _operationOnBucketDocRef(
        bucket.id,
        (bucketDocRef) => bucketDocRef.set(bucket.toFireStore()),
      );

  /// delete bucket and all entries in its subcollection:
  @override
  Future<Either<Failure, Unit>> deleteBucket(DayBucket bucket) =>
      _operationOnBucketDocRef(
        bucket.id,
        (bucketDocRef) => bucketDocRef.delete(),
      );

  /// update bucket and all entries in its subcollection:
  @override
  Future<Either<Failure, Unit>> updateBucket(DayBucket bucket) =>
      _operationOnBucketDocRef(
        bucket.id,
        (bucketDocRef) => bucketDocRef.update(bucket.toFireStore()),
      );

  ///////////////////////////////////
  /// Entry operations:
  ///////////////////////////////////

  @override
  Future<Either<Failure, Unit>> createEntry(
          UniqueId bucketId, FoodItemEntry entry) =>
      _operationOnBucketDocRef(
        bucketId,
        (bucketDocRef) => bucketDocRef.update(updateObjectForEntry(entry)),
      );

  @override
  Future<Either<Failure, Unit>> createEntries(
          UniqueId bucketId, Iterable<FoodItemEntry> entries) =>
      _operationOnBucketDocRef(
        bucketId,
        (bucketDocRef) => bucketDocRef.update(updateObjectForEntries(entries)),
      );

  @override
  Future<Either<Failure, Unit>> createEntryForToday(FoodItemEntry entry) =>
      _operationOnTodaysBucket((bucketId) => createEntry(bucketId, entry));

  @override
  Future<Either<Failure, Unit>> createEntriesForToday(
          Iterable<FoodItemEntry> entries) =>
      _operationOnTodaysBucket((bucketId) => createEntries(bucketId, entries));

  @override
  Future<Either<Failure, Unit>> deleteEntry(
          UniqueId bucketId, FoodItemEntry entry) =>
      _operationOnBucketDocRef(
        bucketId,
        (bucketDocRef) => bucketDocRef.update(deleteObjectForEntry(entry)),
      );

  @override
  Future<Either<Failure, Unit>> deleteEntryForToday(FoodItemEntry entry) =>
      _operationOnTodaysBucket((bucketId) => deleteEntry(bucketId, entry));

  @override
  Stream<Either<Failure, double>> doSetupWork() async* {
    yield right(1);
  }

  @override
  Future<Either<Failure, Unit>> updateEntry(
          UniqueId bucketId, FoodItemEntry entry) =>
      createEntry(bucketId, entry);

  @override
  Future<Either<Failure, Unit>> updateEntryFunctional(UniqueId bucketId,
          UniqueId entryId, MapFunction<FoodItemEntry> applyUpdate) =>
      _operationOnBucketDocRef(
        bucketId,
        (bucketDocRef) async {
          // TODO: THINK: the entire updateEntryFunctional might be a bit inefficient, because the pull and put are two operations.
          // We dont know what happens if something happens to the document in between.
          final json = await bucketDocRef.get();

          final a = json["entries"];
          final before = FoodItemEntry.fromJson(json["entries"][entryId.value]);
          final after = applyUpdate(before);
          await bucketDocRef.update(updateObjectForEntry(after));
        },
      );

  @override
  Future<Either<Failure, Unit>> updateEntryForToday(FoodItemEntry entry) =>
      _operationOnTodaysBucket((bucketId) => updateEntry(bucketId, entry));

  @override
  Future<Either<Failure, Unit>> updateEntryFunctionalForToday(
          UniqueId entryId, MapFunction<FoodItemEntry> applyUpdate) =>
      _operationOnTodaysBucket(
          (bucketId) => updateEntryFunctional(bucketId, entryId, applyUpdate));

  @override
  Stream<Either<Failure, DayBucket>> watchBucket(UniqueId bucketId) async* {
    final bucketDocRef = await _firestore.bucketDocument(bucketId);
    yield* bucketDocRef
        .snapshots()
        .map((docSnapshot) => DayBucketDTO.fromFireStore(docSnapshot))
        .map((e) => right<Failure, DayBucket>(e))
        .onErrorReturn(
            left<Failure, DayBucket>(const FireStoreFailure.unexpected()));
  }

  @override
  Stream<Either<Failure, KtList<DayBucket>>> watchBuckets({
    required int batchSize,
  }) async* {
    await _getOrCreateBucketForToday();
    final userDoc = await _firestore.userDocument();
    yield* userDoc
        .collection(kBucketsCollectionName)
        .orderBy("id", descending: true)
        .limit(batchSize)
        .snapshots()
        .map((colSnapshot) {
      logInfo(
          'DayBucketRepository.watchBuckets() received snapshot of ${colSnapshot.docs.length} buckets');
      final buckets = colSnapshot.docs
          .map((doc) => DayBucketDTO.fromFireStore(doc))
          .toList()
          .asMap()
          .entries
          .where(
            // take only the bucket of today or nonempty buckets
            (entry) => entry.key == 0 || entry.value.entries.isNotEmpty(),
          )
          .map((e) => e.value);

      return buckets.toImmutableList();
    }).map((list) => right<Failure, KtList<DayBucket>>(list));
    // .onErrorReturn(left<Failure, KtList<DayBucket>>(
    //     const FireStoreFailure.unexpected()));
  }

  ///////////////////////////////////
  /// private functions:
  ///////////////////////////////////

  Future<Either<Failure, Unit>> _operationOnTodaysBucket(
      Future<Either<Failure, Unit>> Function(UniqueId bucketId)
          operation) async {
    final bucketIdOrFailure = await _getOrCreateBucketForToday();
    return await bucketIdOrFailure.fold(
      (l) => left(const FireStoreFailure.unexpected()),
      operation,
    );
  }

  Future<Either<Failure, Unit>> _operationOnBucketDocRef(
      bucketId,
      Future<void> Function(DocumentReference<Object?> bucketDocRef)
          operation) async {
    try {
      final bucketDocRef = await _firestore.bucketDocument(bucketId);
      await operation(bucketDocRef);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFailure(e));
    }
  }

  Future<Either<Failure, UniqueId>> _getOrCreateBucketForToday() async {
    try {
      final id = bucketIdForToday();
      final userDoc = await _firestore.userDocument();
      final docRef =
          await userDoc.collection(kBucketsCollectionName).doc(id).get();
      final uniqueId = UniqueId.fromUniqueString(id);
      if (docRef.exists) {
        return right(uniqueId);
      } else {
        final todaysBucket = createBucketForToday();
        var unitOrFailure = await createBucket(todaysBucket);
        return unitOrFailure.fold(
            (l) => left(const FireStoreFailure.unexpected()),
            (r) => right(uniqueId));
      }
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFailure(e));
    }
  }

  _fireBaseExceptionToFailure(FirebaseException e) {
    if (e.message == null) return const FireStoreFailure.unexpected();
    if (e.message!.contains('PERMISSION_DENIED')) {
      return const FireStoreFailure.insufficientPermission();
    } else if (e.message!.contains('NOT_FOUND')) {
      return const FireStoreFailure.notFound();
    } else {
      return const FireStoreFailure.unexpected();
    }
  }
}
