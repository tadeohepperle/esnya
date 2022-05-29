part of 'app_startup_cubit.dart';

@freezed
class AppStartupState with _$AppStartupState {
  const factory AppStartupState.initial() = _Initial;
  const factory AppStartupState.inProgress(double progress) = _InProgress;
  const factory AppStartupState.done() = _Done;
  const factory AppStartupState.failed(Failure failure) = _Failed;
}
