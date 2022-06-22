import 'package:bloc/bloc.dart';
import '../../../domain/app_startup/app_startup_repository.dart';
import 'package:esnya_shared_resources/core/error_handling/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_startup_state.dart';
part 'app_startup_cubit.freezed.dart';

@lazySingleton
class AppStartupCubit extends Cubit<AppStartupState> {
  AppStartupRepository appStartupRepository;
  AppStartupCubit(this.appStartupRepository)
      : super(AppStartupState.initial()) {
    /// AppStartupCubit is a pure bridge to appStartupRepository (Tadeo Hepperle 2022-05-28)
    appStartupRepository.setupState.stream.listen((event) {
      final AppStartupState newState = event.map(
        initial: (_) {
          return const AppStartupState.initial();
        },
        inProgress: (_) {
          return AppStartupState.inProgress(_.progress);
        },
        done: (_) {
          return const AppStartupState.done();
        },
        failed: (_) {
          return AppStartupState.failed(_.failure);
        },
      );
      emit(newState);
    });
  }
}
