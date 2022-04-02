import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/core.dart';

abstract class FoodEntriesRepository extends SetupRepository {
  Stream<Either<Failure, List<FoodItemEntry>>>
      watchAll(); // TODO: watch special time only

  Future<Either<Failure, Unit>> add(FoodItemEntry entry);
  Future<Either<Failure, Unit>> addAll(Iterable<FoodItemEntry> entries);
  Future<Either<Failure, Unit>> update(FoodItemEntry entry);
  Future<Either<Failure, Unit>> updateById(
      UniqueId id, FoodItemEntry Function(FoodItemEntry before) applyUpdate);
  Future<Either<Failure, Unit>> delete(FoodItemEntry entry);
}
