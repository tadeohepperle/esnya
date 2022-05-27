import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/failures.dart';
import 'dart:io';

import 'package:esnya/domain/resources/local_data_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

// just so that noone else will access the get storage by accident.
const String _kLocalStorageKey = "b7s0s8";

// TODO: PRE-RELEASE: To have this repo in both isolates could be a huge source for errors.

@isolate1
@isolate2
@LazySingleton(as: LocalDataRepository)
class LocalDataRepositoryImpl implements LocalDataRepository {
  final GetStorage _storage;
  LocalDataRepositoryImpl() : _storage = GetStorage(_kLocalStorageKey);

  @override
  Future<T?> storageRead<T>(String key) => Future.value(_storage.read<T>(key));

  @override
  Future<void> storageRemove(String key) => _storage.remove(key);

  @override
  Future<void> storageWrite(String key, value) => _storage.write(key, value);
}
