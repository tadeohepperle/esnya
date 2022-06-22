import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/core/data_structures/value_and_stream.dart';

abstract class AppStartupRepository {
  // Future<Either<Failure, Unit>> runFirstTimeUseFlow();

  /// executed on each app_startup during splash screen, before user can do anything.
  /// Used to check for updates, check if all resources are where they belong.
  Future<void> runStartUpFlow();

  ValueAndStream<SetupState> get setupState;
}
