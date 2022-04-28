import 'dart:async';

import 'package:esnya/domain/resources/esnya_resources.dart';
import 'package:esnya/domain/resources/local_data_repository.dart';
import 'package:esnya/domain/resources/resource_request_event.dart';
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

  ResourceRequestStatus _status = const ResourceRequestStatus.unknown();
  final StreamController<ResourceRequestStatus> _streamController =
      StreamController<ResourceRequestStatus>.broadcast();

  String get _zipFileVersionUrl => zipFileUrl + '.version';
  String get _zipFileVersionStorageKey => _zipFileVersionUrl;

  String get _checkSumStorageKey => zipFileUrl + '.checksum';

  @override
  String get path => throw UnimplementedError();

  @override
  ResourceRequestStatus get status => _status;
  set status(value) {
    _status = value;
    _streamController.add(_status);
  }

  @override
  Stream<ResourceRequestStatus> attemptUpdate() {
    Future<void> _attemptUpdate() async {
      final localDataRepository = getIt<LocalDataRepository>();
      final targetFolderPath =
          localDataRepository.dataDirectoryPath + zipFileLocalDirPartialPath;
      final targetZipFilePath = targetFolderPath + '.zip';
      status = const ResourceRequestStatus.inProgress(0);

      /// check if api has newer version than device:
      bool downLoadNeeded = true;
      final versionOrFailure =
          await localDataRepository.getTextFromURL(_zipFileVersionUrl);
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
        status = const ResourceRequestStatus.available();
        return;
      }

      /// only continue if newer version available or checksum corrupted:

      const downloadFractionOfEntireUpdate = 0.9;
      await for (final progress in localDataRepository.downloadFile(
        zipFileUrl,
        targetZipFilePath,
      )) {
        final nullableProgress = progress.toOption().toNullable();
        if (nullableProgress == null /* A Failure Happened */) {
          status = const ResourceRequestStatus.failed();
          return;
        } else {
          status = ResourceRequestStatus.inProgress(
              nullableProgress * downloadFractionOfEntireUpdate);
        }
      }
      status = ResourceRequestStatus.inProgress(downloadFractionOfEntireUpdate);
      await localDataRepository.unzip(targetZipFilePath, targetFolderPath,
          deleteOrigin: true);

      /// cache checksum and version:

      String checksum =
          await localDataRepository.pathCheckSum(targetFolderPath);
      await localDataRepository.storageWrite(_checkSumStorageKey, checksum);
      String? versionOrNull = versionOrFailure.toOption().toNullable();
      if (versionOrNull != null) {
        await localDataRepository.storageWrite(
            _zipFileVersionStorageKey, versionOrNull);
      }

      /// yield the success
      status = const ResourceRequestStatus.available();
    }

    if (status is! InProgress) {
      unawaited(_attemptUpdate().catchError((e) {
        status = const ResourceRequestStatus.failed();
      }));
    }
    return statusStream;
  }

  @override
  Future<bool> checkAvailability() async {
    final localDataRepository = getIt<LocalDataRepository>();
    final targetFolderPath =
        localDataRepository.dataDirectoryPath + zipFileLocalDirPartialPath;
    String checksum = await localDataRepository.pathCheckSum(targetFolderPath);
    final cachedChecksum =
        await localDataRepository.storageRead(_checkSumStorageKey);
    return checksum == cachedChecksum;
  }

  @override
  Stream<ResourceRequestStatus> get statusStream => _streamController.stream;
}
