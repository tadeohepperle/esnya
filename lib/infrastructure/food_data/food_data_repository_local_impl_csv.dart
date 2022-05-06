import 'package:dartz/dartz.dart';
import 'package:esnya/domain/resources/data_directory_path_provider.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

Future<List<Food>> _loadFoodFromLocalCsv() async {
  final foodDataPath =
      DataDirectoryPathProvider.dataDirectoryPath + '/food_data/f.csv';
  final foods = await CsvHelpers.objectsFromCsvFile(foodDataPath, Food.fromList,
      header: true);
  return foods;
}

@isolate2
@lazySingleton
class FoodDataRepositoryLocalImplCsv extends FoodDataRepositoryLocalImpl {
  FoodDataRepositoryLocalImplCsv() : super(right(_loadFoodFromLocalCsv));
}
