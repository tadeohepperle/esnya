/// initialized at app start, gives path to the data directory of the app
abstract class DataDirectoryPathProvider {
  static String _dataDirectoryPath = '';
  static String get dataDirectoryPath => _dataDirectoryPath;

  /// usually something like '/data/user/0/com.thapps.esnya/app_flutter'
  static void setDataDirectoryPath(value) {
    _dataDirectoryPath = value;
  }
}
