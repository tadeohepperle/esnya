import 'dart:async';

import 'package:esnya/domain/resources/data_directory_path_provider.dart';
import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/file_repository.dart';
import 'package:esnya/domain/resources/local_data_repository.dart';
import 'package:esnya/domain/resources/resource_status.dart';
import 'package:esnya/injection.dart';

/// to customize override zipFileUrl and zipFileLocalDirPartialPath in subclasses
abstract class ZipDataResource implements EsnyaResource {
  /// for example 'http://localhost:8080/static/files/food_data.zip'
  /// is is assumed that at zipFileUrl + '.version' a text file with a version number can be found.
  /// the version number gotten from there will be cached in local storage under key "zipFileUrl.version"
  String get zipFileUrl;

  /// for example '/food_data', with leading slash but without trailing slash
  /// after downloading a checksum of the resulting directory contents is computed.
  /// It will be cached in local storage under key "zipFileUrl.checksum"
  String get zipFileLocalDirPartialPath;

  ResourceStatus _status = const ResourceStatus.unknown();
  final StreamController<ResourceStatus> _streamController =
      StreamController<ResourceStatus>.broadcast();

  String get _zipFileVersionUrl => zipFileUrl + '.version';
  String get _zipFileVersionStorageKey => _zipFileVersionUrl;

  String get _checkSumStorageKey => zipFileUrl + '.checksum';

  @override
  ResourceStatus get status => _status;

  @override
  set status(value) {
    _status = value;

    _streamController.add(_status);
  }

  /// should never be done in isolate 2!
  @override
  Stream<ResourceStatus> attemptUpdate() {
    Future<void> _attemptUpdate() async {
      final localDataRepository = getIt<LocalDataRepository>();
      final fileRepo = getIt<FileRepository>();
      final targetFolderPath = DataDirectoryPathProvider.dataDirectoryPath +
          zipFileLocalDirPartialPath;
      final targetZipFilePath = targetFolderPath + '.zip';
      status = const ResourceStatus.inProgress(0);

      /// check if api has newer version than device:
      bool downLoadNeeded = true;
      final versionOrFailure =
          await fileRepo.getTextFromURL(_zipFileVersionUrl);
      downLoadNeeded = await versionOrFailure.fold(
        (failure) => true,
        (versionFromApi) async {
          final cachedVersion = await localDataRepository.storageRead(
              _zipFileVersionStorageKey); // key is just version url
          return versionFromApi != cachedVersion;
        },
      );

      /// if downLoadNeeded is false based on the version cached, check integrity of files on device, by using checksum:
      /// if files on device seem to have been manipulated or deleted, download them newly.
      if (downLoadNeeded == false) {
        final checksumsMatch = await checkAvailability();
        if (!checksumsMatch) {
          downLoadNeeded = true;
        }
      }

      if (!downLoadNeeded) {
        status = const ResourceStatus.available();
        return;
      }

      /// only continue if newer version available or checksum corrupted:

      const downloadFractionOfEntireUpdate = 0.9;
      await for (final progress in fileRepo.downloadFile(
        zipFileUrl,
        targetZipFilePath,
      )) {
        final nullableProgress = progress.toOption().toNullable();
        if (nullableProgress == null /* A Failure Happened */) {
          status = const ResourceStatus.failed();
          return;
        } else {
          status = ResourceStatus.inProgress(
              nullableProgress * downloadFractionOfEntireUpdate);
        }
      }
      status = ResourceStatus.inProgress(downloadFractionOfEntireUpdate);
      await fileRepo.unzip(targetZipFilePath, targetFolderPath,
          deleteOrigin: true);

      /// cache checksum and version:

      String checksum = await fileRepo.pathCheckSum(targetFolderPath);
      await localDataRepository.storageWrite(_checkSumStorageKey, checksum);
      String? versionOrNull = versionOrFailure.toOption().toNullable();
      if (versionOrNull != null) {
        await localDataRepository.storageWrite(
            _zipFileVersionStorageKey, versionOrNull);
      }

      /// yield the success
      status = const ResourceStatus.available();
    }

    if (status is! InProgress) {
      unawaited(_attemptUpdate().catchError((e) {
        status = const ResourceStatus.failed();
      }));
    }
    return statusStream;
  }

  /// should never be done in isolate 2! (because localDataRepository with GetStorage has problems there)
  @override
  Future<bool> checkAvailability() async {
    final fileRepo = getIt<FileRepository>();
    final localDataRepository = getIt<LocalDataRepository>();
    final targetFolderPath = DataDirectoryPathProvider.dataDirectoryPath +
        zipFileLocalDirPartialPath;
    String checksum = await fileRepo.pathCheckSum(targetFolderPath);
    final cachedChecksum =
        await localDataRepository.storageRead(_checkSumStorageKey);
    return checksum == cachedChecksum;
  }

  @override
  Stream<ResourceStatus> get statusStream => _streamController.stream;
}
