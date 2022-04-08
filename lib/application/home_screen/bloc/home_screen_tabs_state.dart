part of 'home_screen_tabs_bloc.dart';

@freezed
class HomeScreenTabsState with _$HomeScreenTabsState {
  const HomeScreenTabsState._();
  const factory HomeScreenTabsState(HomeScreenTabType tabType) =
      _HomeScreenTabsState;
  factory HomeScreenTabsState.initial() =>
      HomeScreenTabsState(HomeScreenTabType.dashboard);
}
