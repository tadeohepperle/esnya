import 'package:esnya/constants.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya/infrastructure/resources/constants.dart';
import 'package:esnya/domain/resources/data_directory_path_provider.dart';
import 'package:esnya/domain/resources/file_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';

@isolate1
@isolate2
@LazySingleton(as: FileRepository)
class FileRepositoryImpl implements FileRepository {
  @override
  Future<void> deletePath(String path) async {
    final dir = Directory(path);
    final dirExists = await dir.exists();
    if (dirExists) {
      await dir.delete(recursive: true);
      return;
    }
    final file = File(path);
    final fileExists = await file.exists();
    if (fileExists) {
      await file.delete();
    }
  }

  @override
  Future<List<FileSystemEntity>> directoryContents(Directory directory,
      {bool recursive = true}) {
    var files = <FileSystemEntity>[];
    var completer = Completer<List<FileSystemEntity>>();
    var lister = directory.list(recursive: true);
    lister.listen((file) => files.add(file),
        onDone: () => completer.complete(files),
        onError: (e) {
          completer.completeError(e);
        });
    return completer.future;
  }

  @override
  Future<Either<Failure, String>> getTextFromURL(String url) async {
    try {
      logInfo('called FileRepository.getTextFromURL($url)');
      String text = await http.read(Uri.parse(url)).timeout(connectionTimeout);
      return right(text);
    } catch (e) {
      logInfo('FileRepository.getTextFromURL($url) failed with $e');
      return left(ApiFailure.unexpected());
    }
  }

  @override
  Stream<Either<Failure, double>> downloadFile(
      String url, String targetPath) async* {
    try {
      logInfo('trying to download file from $url to $targetPath');
      final client = http.Client();
      final request = http.Request('GET', Uri.parse(url));
      final response = await client.send(request).timeout(connectionTimeout);
      final totalLength = response.contentLength ?? 0;
      int receivedLength = response.contentLength ?? 0;
      final List<int> bytes = [];
      final stream = response.stream;
      final _localFile = File(targetPath);
      final _localFileExists = await _localFile.exists();
      // if (_localFileExists) {
      //   logInfo('delete existing file at $targetPath');
      //   await _localFile.delete();
      // }
      await for (var data in stream) {
        bytes.addAll(data);
        receivedLength += data.length;
        yield right(receivedLength.toDouble() / totalLength.toDouble());
      }
      await _localFile.writeAsBytes(bytes);
      logInfo('Download successful for file from $url to $targetPath');
      yield right(1.0);
      client.close();
    } catch (ex) {
      logInfo('Download failed for file from $url to $targetPath');
      yield left(const ApiFailure.unexpected());
    }
  }

  @override
  Future<String> pathCheckSum(String path) async {
    final dir = Directory(path);
    final dirExists = await dir.exists();
    if (dirExists) {
      return await _dirCheckSum(dir);
    }
    final file = File(path);
    final fileExists = await file.exists();
    if (fileExists) {
      return await _fileCheckSum(file);
    }
    return "path does not exist";
  }

  Future<String> _dirCheckSum(Directory directory) async {
    final contents = await directoryContents(directory);
    String stringForHash = "";
    for (var el in contents) {
      final s = await FileStat.stat(el.path);
      stringForHash += "${el.path}|${s.size}";
    }
    final s = await FileStat.stat(directory.path);
    stringForHash += "${directory.path}|${s.size}";
    return deterministicHash(stringForHash);
  }

  Future<String> _fileCheckSum(File file) async {
    final s = await FileStat.stat(file.path);
    final stringForHash = "${file.path}|${s.size}";
    return deterministicHash(stringForHash);
  }

  @override
  Future<void> unzip(String originPath, String targetPath,
      {bool deleteOrigin = false}) async {
    final zipFile = File(originPath);
    final destinationDir = Directory(targetPath);
    logInfo('Unzip from $originPath to $targetPath');
    await ZipFile.extractToDirectory(
        zipFile: zipFile, destinationDir: destinationDir);
    if (deleteOrigin) {
      await File(originPath).delete();
      logInfo('Deleted File at $originPath');
    }
  }

  @override
  Future<Either<Failure, String>> copyFileFromAssetBundleToDataDirectory(
      String assetKey, String targetFileName) async {
    try {
// TODO: implement copyFileFromAssetBundleToDataDirectory
      final dDirPath = DataDirectoryPathProvider.dataDirectoryPath;
      // create /assets dir if not there yet
      final assetsDir = Directory('$dDirPath/$dataDirAssetDirSubDirName');
      if (!(await assetsDir.exists())) {
        assetsDir.create(recursive: true);
      }
      // read bytedata from rootBundle and write to file:
      final byteData = await rootBundle.load(assetKey);
      final buffer = byteData.buffer;
      final filePath = '$dDirPath/$dataDirAssetDirSubDirName/$targetFileName';
      final f = File(filePath);
      await f.writeAsBytes(
          buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      return right(filePath);
    } catch (ex) {
      logError(ex);
      return left(const DataFailure.unexpected());
    }
  }
}
