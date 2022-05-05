import 'package:dartz/dartz.dart';
import 'package:esnya/domain/resources/local_data_repository.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/infrastructure/resources/food_data_resource.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

Future<List<FoodMappingObject>> _loadFoodFromLocalCsv() async {
  final localDataRepository = getIt<LocalDataRepository>();
  final fdr = getIt<ResourceRepository>().getResource<FoodDataResource>();
  final foodDataPath = localDataRepository.dataDirectoryPath +
      fdr.zipFileLocalDirPartialPath +
      '/fm.csv';
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
