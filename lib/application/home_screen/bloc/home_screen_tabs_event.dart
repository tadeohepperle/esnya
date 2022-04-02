part of 'home_screen_tabs_bloc.dart';

@freezed
class HomeScreenTabsEvent with _$HomeScreenTabsEvent {
  const factory HomeScreenTabsEvent.setTab(HomeScreenTabType tabType) = _SetTab;
}
