import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya/domain/food_data/entities/food_item.dart';
import 'package:esnya/domain/food_data/entities/food_item_collection.dart';
import 'package:esnya/domain/food_data/entities/food_item_string.dart';

abstract class FoodDataRepository {
  Future<Either<Failure, Unit>> addItem(FoodItem item,
      {FoodItemCollection? collection});
  Future<Either<Failure, Unit>> updateItem(FoodItem item,
      {FoodItemCollection? collection});
  Future<Either<Failure, Unit>> removeItem(FoodItem item,
      {FoodItemCollection? collection});
  Future<Either<Failure, Unit>> addCollection(FoodItemCollection collection);
  Future<Either<Failure, Unit>> updateCollection(FoodItemCollection collection);
  Future<Either<Failure, Unit>> removeCollection(FoodItemCollection collection);

  // the open collection is the one new foodItems get added too. Once there is a sufficient distance between the time the last foodItem in the open collection was created and a new incoming fooditem, a new open collection shall be created.
  Stream<Either<Failure, FoodItemCollection>> watchOpenCollection();

  Stream<Either<Failure, FoodItemCollection>> watchClosedCollections();
}
