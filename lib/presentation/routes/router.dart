import 'package:auto_route/annotations.dart';
import 'package:esnya/presentation/splash_screen/splash_screen_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreenPage, initial: true),
  ],
)
class $AppRouter {}
