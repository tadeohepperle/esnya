import 'package:esnya/domain/isolate2/isolate_2_repository.dart';
import 'package:esnya/domain/user_data/food_item_entry_bucket_repository.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';

import 'injection.dart';

Future<void> setupServices() async {
  setupEsnyaSharedResources();
  await Future.wait([
    getIt<Isolate2Repository>().setup(),
    getIt<FoodItemEntryBucketRepository>().setup(),
  ]);
}
