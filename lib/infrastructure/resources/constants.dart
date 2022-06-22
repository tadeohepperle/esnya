import '../../domain/resources/data_directory_path_provider.dart';

const String foodCSVassetKey = 'assets/f.csv';
const String foodCSVtargetFileName = 'f.csv';
const String foodMappingCSVassetKey = 'assets/fm.csv';
const String foodMappingCSVtargetFileName = 'fm.csv';
const String dataDirAssetDirSubDirName = 'assets';

String get dataDirectoryPath => DataDirectoryPathProvider.dataDirectoryPath;
String get foodCSVLocalPath =>
    '$dataDirectoryPath/$dataDirAssetDirSubDirName/$foodCSVtargetFileName';
String get foodMappingCSVLocalPath =>
    '$dataDirectoryPath/$dataDirAssetDirSubDirName/$foodMappingCSVtargetFileName';
