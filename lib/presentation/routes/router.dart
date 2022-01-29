import 'package:auto_route/annotations.dart';
import 'package:esnya/presentation/sign_in/sign_in_page.dart';
import 'package:esnya/presentation/splash_screen/splash_screen_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreenPage, initial: true),
    AutoRoute(page: SignInPage)
  ],
)
class $AppRouter {}
