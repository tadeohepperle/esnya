import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:path_provider/path_provider.dart';

import 'domain/app_startup/app_startup_repository.dart';
import 'domain/isolate2/isolate_2_repository.dart';
import 'domain/resources/data_directory_path_provider.dart';
import 'domain/user_data/day_bucket_repository.dart';
import 'injection.dart';

Future<void> setupServicesIsolate1() async {
  setupEsnyaSharedResources();

  /// usually something like '/data/user/0/com.thapps.esnya/app_flutter'
  final dataDirectory = await getApplicationDocumentsDirectory();
  print(dataDirectory);
  DataDirectoryPathProvider.setDataDirectoryPath(dataDirectory.path);
  await Future.wait([
    getIt<Isolate2Repository>().setup(),
    getIt<DayBucketsRepository>().setup(),
  ]);

  getIt<AppStartupRepository>().runStartUpFlow();
}

Future<void> setupServicesIsolate2() async {
  setupEsnyaSharedResources();
  await Future.wait([
    // getIt<FoodDataRepository>().setup(),  // not necessary since appStartupRepository triggers them via isolate bridge once it is made sure that local csv data is available
    // getIt<FoodMappingRepository>().setup(), // not necessary since appStartupRepository triggers them via isolate bridge once it is made sure that local csv data is available
  ]);
}
