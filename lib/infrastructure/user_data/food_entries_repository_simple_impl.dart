import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/user_data/food_entries_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';

@isolate1
@LazySingleton(as: FoodEntriesRepository)
class FoodEntriesRepositorySimpleImpl extends SetupRepositoryImpl
    implements FoodEntriesRepository {
  List<FoodItemEntry> _entries = [];

  final StreamController<Either<Failure, List<FoodItemEntry>>> _controller =
      StreamController<Either<Failure, List<FoodItemEntry>>>.broadcast();

  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    _controller.onListen = () {
      print("onlisten");
      _controller.add(right(_entries));
    };
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> add(FoodItemEntry entry) async {
    _entries.add(entry);
    _controller.sink.add(right(_entries));
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> delete(FoodItemEntry entry) async {
    _entries.remove(entry);
    _controller.add(right(_entries));
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> update(FoodItemEntry entry) async {
    _entries = _entries.map((e) => e.id == entry.id ? entry : e).toList();
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateById(UniqueId id,
      FoodItemEntry Function(FoodItemEntry before) applyUpdate) async {
    _entries = _entries.map((e) => e.id == id ? applyUpdate(e) : e).toList();
    return right(unit);
  }

  @override
  Stream<Either<Failure, List<FoodItemEntry>>> watchAll() => _controller.stream;

  @override
  Future<Either<Failure, Unit>> addAll(Iterable<FoodItemEntry> entries) async {
    _entries.addAll(entries);
    _controller.add(right(_entries));
    return right(unit);
  }
}
