import '../../application/home_screen/home_screen_tab_type.dart';
import '../../presentation/core/core.dart';

extension AppLocalizationsX on AppLocalizations {
  String homeScreenTabTitle(HomeScreenTabType tab) {
    return {
          HomeScreenTabType.calculator: homeScreenTabCalculatorTitle,
          HomeScreenTabType.dashboard: homeScreenTabDashboardTitle,
          HomeScreenTabType.profile: homeScreenTabProfileTitle,
        }[tab] ??
        'Unknown title';
  }
}
