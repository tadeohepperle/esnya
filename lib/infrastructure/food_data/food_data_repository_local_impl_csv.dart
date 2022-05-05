import 'package:dartz/dartz.dart';
import 'package:esnya/domain/resources/local_data_repository.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/infrastructure/resources/food_data_resource.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

Future<List<Food>> _loadFoodFromLocalCsv() async {
  final localDataRepository = getIt<LocalDataRepository>();
  final fdr = getIt<ResourceRepository>().getResource<FoodDataResource>();
  final foodDataPath = localDataRepository.dataDirectoryPath +
      fdr.zipFileLocalDirPartialPath +
      '/f.csv';
  final foods = await CsvHelpers.objectsFromCsvFile(foodDataPath, Food.fromList,
      header: true);
  return foods;
}

@isolate2
@lazySingleton
class FoodDataRepositoryLocalImplCsv extends FoodDataRepositoryLocalImpl {
  FoodDataRepositoryLocalImplCsv() : super(right(_loadFoodFromLocalCsv));
}
