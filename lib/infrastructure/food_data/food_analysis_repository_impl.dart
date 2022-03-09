import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:esnya/domain/food_data/entities/food_item.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/food_data/food_analysis_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FoodAnalysisRepository)
class FoodAnalysisRepositoryImpl implements FoodAnalysisRepository {
  @override
  Future<Either<FoodFetchingFailure, FoodItemValue>> fetchAmountAndFood(
      FoodItemString foodItemString) {
    throw UnimplementedError();
  }
}
