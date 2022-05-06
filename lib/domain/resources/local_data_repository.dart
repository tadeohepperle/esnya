import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/core.dart';

abstract class LocalDataRepository {
  /// the double represents progress on a scale from 0 to 0.
  Future<T?> storageRead<T>(String key);
  Future<void> storageWrite(String key, dynamic value);
  Future<void> storageRemove(String key);
}
