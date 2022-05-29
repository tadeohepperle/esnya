import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/error_handling/failure.dart';

/// commonly used operations such as downloads, unzipping, save to storage, etc...
abstract class FileRepository {
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

  /// returns target path where the file was copied to
  /// assetbundle (rootBundle) only available in isolate 1
  /// [assetKey] should look like assets/filename.xyz
  /// [targetFileName] should look like filename.xyz will then be created at e.g. /data/user/0/com.thapps.esnya/app_flutter/assets/filename.xyz
  Future<Either<Failure, String>> copyFileFromAssetBundleToDataDirectory(
      String assetKey, String targetFileName);
}
