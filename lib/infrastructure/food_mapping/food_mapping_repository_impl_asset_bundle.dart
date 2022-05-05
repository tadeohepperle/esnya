import 'package:dartz/dartz.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

const String assetKeyFoodMappingCsv = 'assets/fm.csv';

Future<List<FoodMappingObject>> _loadFoodMappingObjectsFromAssets() async {
  final csvString = await rootBundle.loadString(assetKeyFoodMappingCsv);
  return CsvHelpers.objectsFromCsv(csvString, FoodMappingObject.fromList,
      header: true);
}

@isolate2
@LazySingleton(as: FoodMappingRepository)
class FoodMappingRepositoryImplAssetBundle
    extends FoodMappingRepositoryLocalImpl {
  FoodMappingRepositoryImplAssetBundle({
    required FoodDataRepository foodDataRepository,
    required SimilarityCalculator similarityCalculator,
  }) : super(
            foodDataRepository: foodDataRepository,
            similarityCalculator: similarityCalculator,
            foodMappingObjectsPathOrLoadFunction:
                right(_loadFoodMappingObjectsFromAssets));
}
