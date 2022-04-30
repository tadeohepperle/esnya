import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya/infrastructure/core/firestore_helpers.dart';
import 'package:esnya/infrastructure/user_data/dtos/food_item_entry_bucket_dto.dart';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya/domain/user_data/food_item_entry_bucket_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:rxdart/rxdart.dart';

import 'utils/food_item_entry_bucket_utils.dart';

/// buckets are saved under collection: user/useridxyz/buckets

@isolate1
@LazySingleton(as: FoodItemEntryBucketRepository)
class FoodItemEntryBucketRepositoryImplFirebase extends SetupRepositoryImpl
    implements FoodItemEntryBucketRepository {
  final FirebaseFirestore _firestore;

  FoodItemEntryBucketRepositoryImplFirebase(this._firestore) {}

  ///////////////////////////////////
  /// Bucket operations:
  ///////////////////////////////////

  /// create bucket and all entries in its subcollection:
  @override
  Future<Either<Failure, Unit>> createBucket(FoodItemEntryBucket bucket) =>
      _operationOnBucketDocRef(
        bucket.id,
        (bucketDocRef) => bucketDocRef.set(bucket.toFireStore()),
      );

  /// delete bucket and all entries in its subcollection:
  @override
  Future<Either<Failure, Unit>> deleteBucket(FoodItemEntryBucket bucket) =>
      _operationOnBucketDocRef(
        bucket.id,
        (bucketDocRef) => bucketDocRef.delete(),
      );

  /// update bucket and all entries in its subcollection:
  @override
  Future<Either<Failure, Unit>> updateBucket(FoodItemEntryBucket bucket) =>
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
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateEntry(
          UniqueId bucketId, FoodItemEntry entry) =>
      createEntry(bucketId, entry);

  @override
  Future<Either<Failure, Unit>> updateEntryFunctional(
          UniqueId bucketId,
          UniqueId entryId,
          FoodItemEntry Function(FoodItemEntry before) applyUpdate) =>
      _operationOnBucketDocRef(
        bucketId,
        (bucketDocRef) async {
          // TODO: THINK: the entire updateEntryFunctional might be a bit inefficient, because the pull and put are two operations.
          // We dont know what happens if something happens to the document in between.
          final json = await bucketDocRef.get();
          final before = FoodItemEntry.fromJson(json["entries"][entryId]);
          final after = applyUpdate(before);
          await bucketDocRef.update(updateObjectForEntry(after));
        },
      );

  @override
  Future<Either<Failure, Unit>> updateEntryForToday(FoodItemEntry entry) =>
      _operationOnTodaysBucket((bucketId) => updateEntry(bucketId, entry));

  @override
  Future<Either<Failure, Unit>> updateEntryFunctionalForToday(UniqueId entryId,
          FoodItemEntry Function(FoodItemEntry before) applyUpdate) =>
      _operationOnTodaysBucket(
          (bucketId) => updateEntryFunctionalForToday(bucketId, applyUpdate));

  @override
  Stream<Either<Failure, FoodItemEntryBucket>> watchBucket(
      UniqueId bucketId) async* {
    final bucketDocRef = await _firestore.bucketDocument(bucketId);
    yield* bucketDocRef
        .snapshots()
        .map((docSnapshot) => FoodItemEntryBucketDTO.fromFireStore(docSnapshot))
        .map((e) => right<Failure, FoodItemEntryBucket>(e))
        .onErrorReturn(left<Failure, FoodItemEntryBucket>(
            const FireStoreFailure.unexpected()));
  }

  @override
  Stream<Either<Failure, KtList<FoodItemEntryBucket>>> watchLogBuckets({
    /// for example 'log-2022-04-13'
    required int batchSize,
  }) async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc
        .collection(kBucketsCollectionName)
        .where("type", isEqualTo: 'log')
        .orderBy(FieldPath.documentId, descending: true)
        .limit(batchSize)
        .snapshots()
        .map((colSnapshot) {
      print('SNAPSHOT!\n\n');
      print(colSnapshot.docs);
      return colSnapshot.docs
          .map((doc) => FoodItemEntryBucketDTO.fromFireStore(doc))
          .toImmutableList();
    }).map((list) => right<Failure, KtList<FoodItemEntryBucket>>(list));
    // .onErrorReturn(left<Failure, KtList<FoodItemEntryBucket>>(
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
