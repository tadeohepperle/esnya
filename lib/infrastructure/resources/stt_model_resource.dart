import 'package:esnya/constants.dart';
import 'package:esnya/infrastructure/resources/zip_data_resource.dart';

/// fm.csv and f.csv, fetched as food_data.zip from server and stored on disk.
class SttModelResource extends ZipDataResource {
  SttModelResource() : super();

  @override
  String get zipFileLocalDirPartialPath =>
      '/stt_model_en_1'; // TODO: later language specific not only english

  @override
  String get zipFileUrl =>
      kEsnyaBackendAPIbaseURL + 'static/files/stt_model_en_1.zip';

  @override
  String get resourceId => "STT_MODEL_EN_1";
}
