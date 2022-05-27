import 'package:esnya/domain/isolate2/isolate_2_repository.dart';
import 'package:esnya/domain/resources/data_directory_path_provider.dart';
import 'package:esnya/domain/user_data/food_item_entry_bucket_repository.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:path_provider/path_provider.dart';

import 'domain/resources/local_data_repository.dart';
import 'injection.dart';

Future<void> setupServicesIsolate1() async {
  setupEsnyaSharedResources();

  final dataDirectory = await getApplicationDocumentsDirectory();
  DataDirectoryPathProvider.setDataDirectoryPath(dataDirectory.path);

  await Future.wait([
    getIt<Isolate2Repository>().setup(),
    getIt<FoodItemEntryBucketRepository>().setup(),
  ]);
}

Future<void> setupServicesIsolate2() async {
  setupEsnyaSharedResources();
  await Future.wait([
    getIt<FoodDataRepository>().setup(),
    getIt<FoodMappingRepository>().setup(),
  ]);
}
