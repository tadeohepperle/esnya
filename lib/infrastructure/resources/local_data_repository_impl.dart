import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'dart:io';

import 'package:esnya/domain/resources/local_data_repository.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../injection_environments.dart';

// just so that noone else will access the get storage by accident.
const String _kLocalStorageKey = "b7s0s8";

// TODO: PRE-RELEASE: To have this repo in both isolates could be a huge source for errors.
@isolate1
@isolate2
@lazySingleton
class LocalDataRepositoryImpl extends SetupRepositoryImpl
    implements LocalDataRepository {
  final GetStorage _storage;
  LocalDataRepositoryImpl() : _storage = GetStorage(_kLocalStorageKey);
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
        // should also register onError
        onDone: () => completer.complete(files),
        onError: (e) {
          completer.completeError(e);
        });
    return completer.future;
  }

  @override
  Future<Either<Failure, String>> getTextFromURL(String url) async {
    try {
      String text = await http.read(Uri.parse(url));
      return right(text);
    } catch (e) {
      return left(ApiFailure.unexpected());
    }
  }

  @override
  Stream<Either<Failure, double>> downloadFile(
      String url, String targetPath) async* {
    try {
      final client = http.Client();
      final request = http.Request('GET', Uri.parse(url));
      final response = await client.send(request);
      final totalLength = response.contentLength ?? 0;
      int receivedLength = response.contentLength ?? 0;
      final List<int> bytes = [];
      final stream = response.stream;
      final _localFile = File(targetPath);
      await _localFile.delete();
      await for (var data in stream) {
        bytes.addAll(data);
        receivedLength += data.length;
        yield right(receivedLength.toDouble() / totalLength.toDouble());
      }
      await _localFile.writeAsBytes(bytes);
      print("Downloaded File to $targetPath");
      yield right(1.0);
      client.close();
    } catch (ex) {
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
  Future<T?> storageRead<T>(String key) => Future.value(_storage.read<T>(key));

  @override
  Future<void> storageRemove(String key) => _storage.remove(key);

  @override
  Future<void> storageWrite(String key, value) => _storage.write(key, value);

  @override
  Future<void> unzip(String originPath, String targetPath,
      {bool deleteOrigin = false}) async {
    final zipFile = File(originPath);
    final destinationDir = Directory(targetPath);
    print("extract zip archive from $originPath to $targetPath");
    await ZipFile.extractToDirectory(
        zipFile: zipFile, destinationDir: destinationDir);
    if (deleteOrigin) {
      await File(originPath).delete();
      print("deleted $originPath");
    }
  }

  late String _dataDirectoryPath;
  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    final dataDirectory = await getApplicationDocumentsDirectory();
    _dataDirectoryPath = dataDirectory.path;
    return right(unit);
  }

  @override
  String get dataDirectoryPath => _dataDirectoryPath;
}
