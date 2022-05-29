import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:esnya/domain/app_startup/app_startup_repository.dart';
import 'package:esnya/domain/resources/data_directory_path_provider.dart';
import 'package:esnya/domain/resources/file_repository.dart';
import 'package:esnya/infrastructure/food_data/food_data_repository_isolate_2.dart';
import 'package:esnya/infrastructure/resources/constants.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:esnya_shared_resources/core/data_structures/streamable_value.dart';
import 'package:esnya_shared_resources/core/data_structures/value_and_stream.dart';
import 'package:esnya_shared_resources/food_data/repositories/food_data_repository.dart';
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@isolate1
@LazySingleton(as: AppStartupRepository)
class AppStartupRepositoryImpl implements AppStartupRepository {
  final FileRepository fileRepository;

  final StreamableValue<SetupState> _setupState =
      StreamableValue(const SetupState.initial());

  AppStartupRepositoryImpl(this.fileRepository);

  /// CRUCIAL PART OF THE APP!!
  /// this is used to check for updates, unpack assets from app bundle and other things.
  /// AppStartupBloc can listen to the state to see whats going on.
  @override
  Future<void> runStartUpFlow() async {
    _setupState.value = const SetupInProgress(0);

    const totalProgressSteps = 10;
    int progressSteps = 0;
    void addProgressSteps([int s = 1]) {
      progressSteps += s;
      _setupState.value = SetupInProgress(progressSteps / totalProgressSteps);
    }

    /////////////////////////////////////////////////////////////////////
    /// WRITE f.csv and fm.csv from asset Bundle to data directory path, if not there yet.
    /////////////////////////////////////////////////////////////////////

    if (!await (File(foodCSVLocalPath).exists())) {
      final fCSVresult =
          await fileRepository.copyFileFromAssetBundleToDataDirectory(
              foodCSVassetKey, foodCSVtargetFileName);
      final failureOrNull = fCSVresult.fold(id, (r) => null);
      if (failureOrNull != null) {
        _setupState.value = SetupFailed(failureOrNull);
        return;
      }
    }
    getIt<FoodDataRepository>().setup(); // to load/reload the csv
    addProgressSteps(4);

    if (!await (File(foodMappingCSVLocalPath).exists())) {
      final fmCSVresult =
          await fileRepository.copyFileFromAssetBundleToDataDirectory(
              foodMappingCSVassetKey, foodMappingCSVtargetFileName);
      final failureOrNull = fmCSVresult.fold(id, (r) => null);
      if (failureOrNull != null) {
        _setupState.value = SetupFailed(failureOrNull);
        return;
      }
    }
    getIt<FoodMappingRepository>().setup(); // to load/reload the csv
    addProgressSteps(4);

    /////////////////////////////////////////////////////////////////////
    /// end of required setup on appstart, emit state done
    /////////////////////////////////////////////////////////////////////
    await Future.delayed(Duration(milliseconds: 1000));
    _setupState.value = SetupDone();
  }

  @override
  ValueAndStream<SetupState> get setupState => _setupState.valueAndStream;
}
