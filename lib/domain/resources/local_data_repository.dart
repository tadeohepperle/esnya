import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/core.dart';

/// commonly used operations such as downloads, unzipping, save to storage, etc...
abstract class LocalDataRepository implements SetupRepository {
  /// the double represents progress on a scale from 0 to 0.
  Stream<Either<Failure, double>> downloadFile(String url, String targetPath);

  Future<Either<Failure, String>> getTextFromURL(String url);
  // for example originPath = data/food_data.zip and targetPath = data/food_data
  Future<void> unzip(String originPath, String targetPath,
      {bool deleteOrigin = false});
  Future<List<FileSystemEntity>> directoryContents(Directory directory,
      {bool recursive = true});
  Future<String> pathCheckSum(String path);

  /// deletes a file or directory (recursively)
  Future<void> deletePath(String path);
  Future<T?> storageRead<T>(String key);
  Future<void> storageWrite(String key, dynamic value);
  Future<void> storageRemove(String key);
  String get dataDirectoryPath;
}
