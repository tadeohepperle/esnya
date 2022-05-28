import 'package:dartz/dartz.dart';
import 'dart:async';

import 'package:esnya/domain/app_startup/app_startup_repository.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/core/data_structures/streamable_value.dart';

class AppStartupRepositoryImpl implements AppStartupRepository {
  StreamableValue<SetupState> setupState =
      StreamableValue(const SetupState.initial());

  /// CRUCIAL PART OF THE APP!!
  /// this is used to check for updates, unpack assets from app bundle and other things.
  /// AppStartupBloc can listen to the state to see whats going on.
  @override
  Future<Either<Failure, Unit>> runStartUpFlow() {
    // TODO: implement runStartUpFlow
    throw UnimplementedError();
  }
}
