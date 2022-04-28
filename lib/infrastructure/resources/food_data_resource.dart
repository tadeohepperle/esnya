import 'package:esnya/constants.dart';
import 'package:esnya/infrastructure/resources/zip_data_resource.dart';

/// fm.csv and f.csv, fetched as food_data.zip from server and stored on disk.
class FoodDataResource extends ZipDataResource {
  FoodDataResource() : super();

  @override
  String get zipFileLocalDirPartialPath => '/food_data';

  @override
  String get zipFileUrl =>
      kEsnyaBackendAPIbaseURL + 'static/files/food_data.csv';
}
