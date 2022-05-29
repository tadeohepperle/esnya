import 'package:dartz/dartz.dart';
import 'package:esnya/infrastructure/resources/constants.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

Future<List<Food>> _loadFoodFromLocalCsv() async {
  final foodDataPath = foodCSVLocalPath;
  final foods = await CsvHelpers.objectsFromCsvFile(foodDataPath, Food.fromList,
      header: true);
  return foods;
}

@isolate2
@lazySingleton
class FoodDataRepositoryLocalImplCsv extends FoodDataRepositoryLocalImpl {
  FoodDataRepositoryLocalImplCsv() : super(right(_loadFoodFromLocalCsv));
}
