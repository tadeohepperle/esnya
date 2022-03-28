import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:injectable/injectable.dart';

// TODO: call setup for these repositories somewhere in the app.
@module
abstract class SharedResourcesInjectibleModule {
  @singleton
  FoodDataRepository foodDataRepository() =>
      FoodDataRepositoryLocalImpl('____________.csv');
  @singleton
  FoodMappingRepository foodMappingRepository(
          FoodDataRepository fdatarep, SimilarityCalculator simcalc) =>
      FoodMappingRepositoryLocalImpl(
        foodDataRepository: fdatarep,
        similarityCalculator: simcalc,
        secondaryAttributeMappingPath: '_______________.json',
        foodMappingEntryPointsPath: '____________.csv',
        foodMappingObjectsPath: '____________.csv',
      );
  @singleton
  SimilarityCalculator similarityCalculator() => SimilarityCalculatorImpl();
}
