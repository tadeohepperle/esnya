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
const kBucketsCollectionName = 'buckets';

/// entries are saved under collection: user/useridxyz/buckets/bucketidxyz/entries
const kFoodItemEntriesSubCollectionName = 'entries';

@isolate1
@LazySingleton(as: FoodItemEntryBucketRepository)
class FoodEntriesRepositorySimpleImpl extends SetupRepositoryImpl
    implements FoodItemEntryBucketRepository {
  final FirebaseFirestore _firestore;

  FoodEntriesRepositorySimpleImpl(this._firestore);

  ///////////////////////////////////
  /// Bucket operations:
  ///////////////////////////////////

  /// create bucket and all entries in its subcollection:
  @override
  Future<Either<Failure, Unit>> createBucket(FoodItemEntryBucket bucket) async {
    try {
      final userDoc = await _firestore.userDocument();

      var bucketDocRef =
          userDoc.collection(kBucketsCollectionName).doc(bucket.id.value);
      await bucketDocRef.set(bucket.toFireStore());
      for (var entry in bucket.entries.asList()) {
        bucketDocRef
            .collection(kFoodItemEntriesSubCollectionName)
            .doc(entry.id.value)
            .set(entry.toJson());
      }

      return right(unit);
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFaulure(e));
    }
  }

  /// delete bucket and all entries in its subcollection:
  @override
  Future<Either<Failure, Unit>> deleteBucket(FoodItemEntryBucket bucket) async {
    try {
      final userDoc = await _firestore.userDocument();
      final docRef =
          userDoc.collection(kBucketsCollectionName).doc(bucket.id.value);
      var entryDocs =
          (await docRef.collection(kFoodItemEntriesSubCollectionName).get())
              .docs;
      for (var d in entryDocs) {
        d.reference.delete();
      }
      await docRef.delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFaulure(e));
    }
  }

  /// update bucket and all entries in its subcollection:
  @override
  Future<Either<Failure, Unit>> updateBucket(FoodItemEntryBucket bucket) async {
    try {
      final userDoc = await _firestore.userDocument();
      var bucketDocRef =
          userDoc.collection(kBucketsCollectionName).doc(bucket.id.value);
      await bucketDocRef.update(bucket.toFireStore());
      for (var entry in bucket.entries.asList()) {
        bucketDocRef
            .collection(kFoodItemEntriesSubCollectionName)
            .doc(entry.id.value)
            .set(entry.toJson());
      }
      return right(unit);
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFaulure(e));
    }
  }

  ///////////////////////////////////
  /// Entry operations:
  ///////////////////////////////////

  @override
  Future<Either<Failure, Unit>> createEntry(
      UniqueId bucketId, FoodItemEntry entry) async {
    try {
      final userDoc = await _firestore.userDocument();
      await userDoc
          .collection(kBucketsCollectionName)
          .doc(bucketId.value)
          .collection(kBucketsCollectionName)
          .doc(entry.id.value)
          .set(entry.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFaulure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> createEntries(
      UniqueId bucketId, Iterable<FoodItemEntry> entries) async {
    try {
      final userDoc = await _firestore.userDocument();
      final entriesCollection = userDoc
          .collection(kBucketsCollectionName)
          .doc(bucketId.value)
          .collection(kBucketsCollectionName);
      for (var entry in entries) {
        entriesCollection.doc(entry.id.value).set(entry.toJson());
      }
      return right(unit);
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFaulure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> createEntryToToday(FoodItemEntry entry) =>
      _operationOnTodaysBucket((bucketId) => createEntry(bucketId, entry));

  @override
  Future<Either<Failure, Unit>> createEntriesToToday(
          Iterable<FoodItemEntry> entries) =>
      _operationOnTodaysBucket((bucketId) => createEntries(bucketId, entries));

  @override
  Future<Either<Failure, Unit>> deleteEntry(
      UniqueId bucketId, FoodItemEntry entry) async {
    try {
      final userDoc = await _firestore.userDocument();
      await userDoc
          .collection(kBucketsCollectionName)
          .doc(bucketId.value)
          .collection(kBucketsCollectionName)
          .doc(entry.id.value)
          .delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFaulure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteEntryFromToday(FoodItemEntry entry) =>
      _operationOnTodaysBucket((bucketId) => deleteEntry(bucketId, entry));

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateEntry(
      UniqueId bucketId, FoodItemEntry entry) async {
    try {
      final userDoc = await _firestore.userDocument();
      await userDoc
          .collection(kBucketsCollectionName)
          .doc(bucketId.value)
          .collection(kBucketsCollectionName)
          .doc(entry.id.value)
          .update(entry.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFaulure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateEntryFunctional(
      UniqueId bucketId,
      UniqueId entryId,
      FoodItemEntry Function(FoodItemEntry before) applyUpdate) async {
    try {
      final userDoc = await _firestore.userDocument();
      final docRef = userDoc
          .collection(kBucketsCollectionName)
          .doc(bucketId.value)
          .collection(kBucketsCollectionName)
          .doc(entryId.value);
      var entryJson = await docRef.get();
      var before = FoodItemEntry.fromJson(entryJson.data()!);
      FoodItemEntry after = applyUpdate(before);
      docRef.update(after.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      return left(_fireBaseExceptionToFaulure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateEntryInToday(FoodItemEntry entry) =>
      _operationOnTodaysBucket((bucketId) => updateEntry(bucketId, entry));

  @override
  Future<Either<Failure, Unit>> updateEntryFunctionalInToday(UniqueId entryId,
          FoodItemEntry Function(FoodItemEntry before) applyUpdate) =>
      _operationOnTodaysBucket(
          (bucketId) => updateEntryFunctionalInToday(bucketId, applyUpdate));

  @override
  Stream<Either<Failure, KtList<FoodItemEntryBucket>>>
      watchLoggedBuckets() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc
        .collection('buckets')
        .orderBy('tag', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map(
              (e) => FoodItemEntryBucketDTO.fromFireStore(e),
            ))
        .map(
          (buckets) => right<Failure, KtList<FoodItemEntryBucket>>(buckets
              .where((b) => b.type == FoodItemEntryBucketType.log)
              .toImmutableList()),
        )
        .onErrorReturn(left<Failure, KtList<FoodItemEntryBucket>>(
            const FireStoreFailure.unexpected()));
  }

  _operationOnTodaysBucket(
      Future<Either<Failure, Unit>> Function(UniqueId bucketId)
          operation) async {
    final bucketIdOrFailure = await _getOrCreateBucketForToday();
    return await bucketIdOrFailure.fold(
      (l) => left(const FireStoreFailure.unexpected()),
      operation,
    );
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
      return left(_fireBaseExceptionToFaulure(e));
    }
  }
}

_fireBaseExceptionToFaulure(FirebaseException e) {
  if (e.message == null) return const FireStoreFailure.unexpected();
  if (e.message!.contains('PERMISSION_DENIED')) {
    return const FireStoreFailure.insufficientPermission();
  } else if (e.message!.contains('NOT_FOUND')) {
    return const FireStoreFailure.notFound();
  } else {
    return const FireStoreFailure.unexpected();
  }
}
