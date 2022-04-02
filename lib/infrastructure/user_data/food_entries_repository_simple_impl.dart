import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/user_data/food_entries_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

@isolate1
@LazySingleton(as: FoodEntriesRepository)
class FoodEntriesRepositorySimpleImpl extends SetupRepositoryImpl
    implements FoodEntriesRepository {
  KtList<FoodItemEntry> _entries = <FoodItemEntry>[].toImmutableList();

  final StreamController<Either<Failure, KtList<FoodItemEntry>>> _controller =
      StreamController<Either<Failure, KtList<FoodItemEntry>>>.broadcast();

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    _controller.onListen = () {
      _controller.add(right(_entries));
    };
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> add(FoodItemEntry entry) async {
    _entries += [entry].toImmutableList();
    _controller.add(right(_entries));
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> delete(FoodItemEntry entry) async {
    _entries = _entries.filter((e) => e.id != entry.id);
    _controller.add(right(_entries));
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> update(FoodItemEntry entry) async {
    _entries = _entries.map((e) => e.id == entry.id ? entry : e);
    _controller.add(right(_entries));
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateById(UniqueId id,
      FoodItemEntry Function(FoodItemEntry before) applyUpdate) async {
    _entries = _entries.map((e) => e.id == id ? applyUpdate(e) : e);
    _controller.add(right(_entries));
    return right(unit);
  }

  @override
  Stream<Either<Failure, KtList<FoodItemEntry>>> watchAll() =>
      _controller.stream;

  @override
  Future<Either<Failure, Unit>> addAll(Iterable<FoodItemEntry> entries) async {
    _entries += entries.toImmutableList();
    _controller.add(right(_entries));
    return right(unit);
  }
}
