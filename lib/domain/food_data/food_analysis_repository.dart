import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya/domain/food_data/entities/food_item.dart';
import 'package:esnya/domain/food_data/entities/food_item_collection.dart';
import 'package:esnya/domain/food_data/entities/food_item_string.dart';

abstract class FoodAnalysisRepository {
  // TODO: function that signifies if fetching food is ready to be used.
  Future<Either<FoodFetchingFailure, FoodItemValue>> fetchAmountAndFood(
      FoodItemString foodItemString);
}
