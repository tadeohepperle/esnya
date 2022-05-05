import 'package:esnya/domain/isolate2/isolate_2_repository.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/domain/user_data/food_item_entry_bucket_repository.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';

import 'domain/resources/local_data_repository.dart';
import 'injection.dart';

Future<void> setupServicesIsolate1() async {
  setupEsnyaSharedResources();
  await getIt<LocalDataRepository>().setup();
  print("isolate1: " + getIt<LocalDataRepository>().dataDirectoryPath);
  await Future.wait([
    getIt<Isolate2Repository>().setup(),
    getIt<FoodItemEntryBucketRepository>().setup(),
    getIt<ResourceRepository>().setup(),
  ]);
}

Future<void> setupServicesIsolate2() async {
  setupEsnyaSharedResources();
  await getIt<LocalDataRepository>().setup();
  print("isolate2: " + getIt<LocalDataRepository>().dataDirectoryPath);
  await Future.wait([
    getIt<FoodDataRepository>().setup(),
    getIt<FoodMappingRepository>().setup(),
    getIt<ResourceRepository>().setup(),
  ]);
  getIt<ResourceRepository>()
      .attemptUpdates(); // TODO: is this the right place here in isolate 2?s
}
