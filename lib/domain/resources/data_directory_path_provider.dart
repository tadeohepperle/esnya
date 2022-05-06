abstract class DataDirectoryPathProvider {
  static String _dataDirectoryPath = '';
  static String get dataDirectoryPath => _dataDirectoryPath;
  static void setDataDirectoryPath(value) {
    _dataDirectoryPath = value;
  }
}
