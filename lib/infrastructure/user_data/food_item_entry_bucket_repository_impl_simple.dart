import 'dart:async';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya/domain/user_data/food_item_entry_bucket_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

final DateFormat formatter = DateFormat('yyyy-MM-dd');

// THIS FILE IS INCOMPLETE!!!!

// @isolate1
// @LazySingleton(as: FoodItemEntryBucketRepository)
class FoodEntriesRepositorySimpleImpl extends SetupRepositoryImpl
    implements FoodItemEntryBucketRepository {
  List<FoodItemEntryBucket> _buckets = [];
  final _userId = "21812821821";

  final StreamController<Either<Failure, KtList<FoodItemEntryBucket>>>
      _controller = StreamController<
          Either<Failure, KtList<FoodItemEntryBucket>>>.broadcast();

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    _controller.onListen = () {
      _controller.add(right(_buckets.toImmutableList()));
    };
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> createEntries(
      UniqueId bucketId, Iterable<FoodItemEntry> entries) async {
    _buckets = _buckets
        .map((e) => e.id == bucketId
            ? e.copyWith(entries: e.entries + entries.toImmutableList())
            : e)
        .toList();
    _controller.add(right(_buckets.toImmutableList()));
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> createEntriesForToday(
      Iterable<FoodItemEntry> entries) {
    final bucketId = _getIdOfToday();
    return createEntries(bucketId, entries);
  }

  @override
  Future<Either<Failure, Unit>> createEntry(
      UniqueId bucketId, FoodItemEntry entry) async {
    _buckets = _buckets
        .map((e) => e.id == bucketId
            ? e.copyWith(entries: e.entries + [entry].toImmutableList())
            : e)
        .toList();
    _controller.add(right(_buckets.toImmutableList()));
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> createEntryForToday(FoodItemEntry entry) {
    final bucketId = _getIdOfToday();
    return createEntry(bucketId, entry);
  }

  @override
  Future<Either<Failure, Unit>> deleteEntry(
      UniqueId bucketId, FoodItemEntry entry) {
    // TODO: implement deleteEntry
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteEntryForToday(FoodItemEntry entry) {
    // TODO: implement deleteEntryFromToday
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateEntry(
      UniqueId bucketId, FoodItemEntry entry) async {
    _buckets = _buckets.map((e) {
      if (e.id != bucketId) return e;
      return e.copyWith(entries: e.entries.map((p0) {
        if (p0.id != entry.id) return p0;
        return entry;
      }));
    }).toList();
    _controller.add(right(_buckets.toImmutableList()));
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateEntryFunctional(
      UniqueId bucketId,
      UniqueId entryId,
      FoodItemEntry Function(FoodItemEntry before) applyUpdate) async {
    _buckets = _buckets.map((e) {
      if (e.id != bucketId) return e;
      return e.copyWith(entries: e.entries.map((p0) {
        if (p0.id != entryId) return p0;
        return applyUpdate(p0);
      }));
    }).toList();
    _controller.add(right(_buckets.toImmutableList()));
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateEntryFunctionalForToday(UniqueId entryId,
      FoodItemEntry Function(FoodItemEntry before) applyUpdate) {
    final bucketId = _getIdOfToday();
    return updateEntryFunctional(bucketId, entryId, applyUpdate);
  }

  @override
  Future<Either<Failure, Unit>> updateEntryForToday(FoodItemEntry entry) {
    final bucketId = _getIdOfToday();
    return updateEntry(bucketId, entry);
  }

  @override
  Stream<Either<Failure, KtList<FoodItemEntryBucket>>> watchLogBuckets() {
    return _controller.stream;
  }

  String _tagForToday() => formatter.format(DateTime.now());
  UniqueId _getIdOfToday() {
    final tagForToday = _tagForToday();
    var bucketToday = _buckets.firstWhereOrNull(
        (e) => e.type == FoodItemEntryBucketType.log && e.tag == tagForToday);
    if (bucketToday == null) {
      bucketToday ??= FoodItemEntryBucket(
        entries: <FoodItemEntry>[].toImmutableList(),
        userId: UniqueId.fromUniqueString(_userId),
        id: UniqueId(),
        type: FoodItemEntryBucketType.log,
        tag: tagForToday,
      );
      _buckets.add(bucketToday);
    }
    return bucketToday.id;
  }

  @override
  Future<Either<Failure, Unit>> createBucket(FoodItemEntryBucket bucket) {
    // TODO: implement createBucket
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteBucket(FoodItemEntryBucket bucket) {
    // TODO: implement deleteBucket
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateBucket(FoodItemEntryBucket bucket) {
    // TODO: implement updateBucket
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, FoodItemEntryBucket>> watchBucket(UniqueId bucketId) {
    // TODO: implement watchBucket
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, KtList<FoodItemEntryBucket>>> watchLoggedBuckets() {
    // TODO: implement watchLoggedBuckets
    throw UnimplementedError();
  }
}



  // @override
  // Future<Either<Failure, Unit>> add(FoodItemEntry entry) async {
  //   _entries += [entry].toImmutableList();
  //   _controller.add(right(_entries));
  //   return right(unit);
  // }

  // @override
  // Future<Either<Failure, Unit>> delete(FoodItemEntry entry) async {
  //   _entries = _entries.filter((e) => e.id != entry.id);
  //   _controller.add(right(_entries));
  //   return right(unit);
  // }

  // @override
  // Future<Either<Failure, Unit>> update(FoodItemEntry entry) async {
  //   _entries = _entries.map((e) => e.id == entry.id ? entry : e);
  //   _controller.add(right(_entries));
  //   return right(unit);
  // }

  // @override
  // Future<Either<Failure, Unit>> updateById(UniqueId id,
  //     FoodItemEntry Function(FoodItemEntry before) applyUpdate) async {
  //   _entries = _entries.map((e) => e.id == id ? applyUpdate(e) : e);
  //   _controller.add(right(_entries));
  //   return right(unit);
  // }

  // @override
  // Stream<Either<Failure, KtList<FoodItemEntry>>> watchAll() =>
  //     _controller.stream;

  // @override
  // Future<Either<Failure, Unit>> addAll(Iterable<FoodItemEntry> entries) async {
  //   _entries += entries.toImmutableList();
  //   _controller.add(right(_entries));
  //   return right(unit);
  // }
