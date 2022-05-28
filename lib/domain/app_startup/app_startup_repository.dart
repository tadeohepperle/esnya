import 'package:dartz/dartz.dart';
import 'package:esnya_shared_resources/core/core.dart';

abstract class AppStartupRepository {
  // Future<Either<Failure, Unit>> runFirstTimeUseFlow();

  /// executed on each app_startup during splash screen, before user can do anything.
  /// Used to check for updates, check if all resources are where they belong.
  Future<Either<Failure, Unit>> runStartUpFlow();
}
