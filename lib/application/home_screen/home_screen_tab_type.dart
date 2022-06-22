import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/routes/app_router.dart';

part 'home_screen_tab_type.freezed.dart';

@freezed
class HomeScreenTabType with _$HomeScreenTabType {
  const HomeScreenTabType._();
  const factory HomeScreenTabType(NameAndPath nameAndPath) = _HomeScreenTabType;

  static const List<HomeScreenTabType> values = [
    calculator,
    dashboard,
    profile
  ];

  static const HomeScreenTabType calculator =
      HomeScreenTabType(AppRoutes.homeCalulator);
  static const HomeScreenTabType dashboard =
      HomeScreenTabType(AppRoutes.homeDashboard);
  static const HomeScreenTabType profile =
      HomeScreenTabType(AppRoutes.homeProfile);

  factory HomeScreenTabType.fromSlug(String hometabslug) {
    return {
          'calculator': calculator,
          'dashboard': dashboard,
          'profile': profile,
        }[hometabslug] ??
        dashboard;
  }
}
