import 'package:dartz/dartz.dart';
import 'package:esnya/domain/resources/data_directory_path_provider.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

Future<List<FoodMappingObject>> _loadFoodFromLocalCsv() async {
  final foodDataPath =
      DataDirectoryPathProvider.dataDirectoryPath + '/food_data/fm.csv';
  final foods = await CsvHelpers.objectsFromCsvFile(
      foodDataPath, FoodMappingObject.fromList,
      header: true);
  return foods;
}

@isolate2
@lazySingleton
class FoodMappingRepositoryLocalImplCsv extends FoodMappingRepositoryLocalImpl {
  FoodMappingRepositoryLocalImplCsv({
    required SimilarityCalculator similarityCalculator_,
    required FoodDataRepository foodDataRepository_,
  }) : super(
          foodDataRepository: foodDataRepository_,
          similarityCalculator: similarityCalculator_,
          foodMappingObjectsPathOrLoadFunction: right(_loadFoodFromLocalCsv),
        );
}
