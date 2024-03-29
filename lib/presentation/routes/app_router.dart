import 'package:esnya/presentation/home_screen/dashboard/day_details/DayDetailsScreen.dart';
import 'package:esnya_shared_resources/core/core.dart';

import '../../application/home_screen/home_screen_tab_type.dart';
import '../../domain/app_startup/app_startup_repository.dart';
import '../../domain/auth/auth_repository.dart';
import '../error_screen.dart/error_screen_page.dart';
import '../home_screen/home_screen.dart';
import '../sign_in_screen/sign_in_screen.dart';
import '../splash_screen/splash_screen.dart';
import 'package:esnya_shared_resources/core/repositories/setup_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'app_router.freezed.dart';

@LazySingleton()
class AppRouter {
  AuthRepository authRepository;
  AppStartupRepository appStartupRepository;
  final GoRouter _router;
  @override
  RouteInformationParser<Object> get routeInformationParser =>
      _router.routeInformationParser;

  @override
  RouterDelegate<Object> get routerDelegate => _router.routerDelegate;

  AppRouter(this.authRepository, this.appStartupRepository)
      : _router = GoRouter(
          redirect: (state) {
            String? pathOrNullIfAlreadyHeadingThere(String path) {
              return state.location == path ? null : path;
            }

            final startUpState = appStartupRepository.setupState.value;
            if (startUpState is! SetupDone) {
              return pathOrNullIfAlreadyHeadingThere(AppRoutes.splash.path);
            }

            final isSignedIn = authRepository.isSignedIn();
            if (!isSignedIn) {
              return pathOrNullIfAlreadyHeadingThere(AppRoutes.signIn.path);
            }
          },
          routes: [
            GoRoute(
              name: AppRoutes.splash.name,
              path: AppRoutes.splash.path,
              builder: (context, state) => SplashScreen(),
            ),
            GoRoute(
              name: AppRoutes.signIn.name,
              path: AppRoutes.signIn.path,
              builder: (context, state) => SignInScreen(),
            ),
            GoRoute(
              path: AppRoutes.index.path,
              redirect: (_) => AppRoutes.home.path,
            ),
            GoRoute(
              path: AppRoutes.home.path,
              redirect: (_) => AppRoutes.homeDashboard.path,
            ),
            GoRoute(
                path: '/home/:hometabslug',
                builder: (context, state) {
                  final hometabslug = state.params['hometabslug']!;
                  return HomeScreen(
                    key: state.pageKey,
                    tab: HomeScreenTabType.fromSlug(hometabslug),
                  );
                },
                routes: [
                  GoRoute(
                      path: ":slug2",
                      builder: (context, state) {
                        final hometabslug = state.params['hometabslug']!;
                        final bucketId = state.params['slug2']!;
                        if (hometabslug == "dashboard") {
                          return DayDetailsScreen(
                              bucketId: UniqueId.fromUniqueString(bucketId));
                        } else {
                          return ErrorScreenPage();
                        }
                      })
                ]),
          ],
          errorBuilder: (context, state) {
            return ErrorScreenPage();
          },
        );
}

class AppRoutes {
  static const NameAndPath splash = NameAndPath('splash', '/splash');
  static const NameAndPath signIn = NameAndPath('signIn', '/sign-in');
  static const NameAndPath index =
      NameAndPath('index', '/'); // redirects to home
  static const NameAndPath home = NameAndPath('home', '/home');
  static const NameAndPath homeDashboard =
      NameAndPath('homeDashboard', '/home/dashboard');
  static const NameAndPath homeCalulator =
      NameAndPath('homeCalulator', '/home/calculator');
  static const NameAndPath homeProfile =
      NameAndPath('homeProfile', '/home/profile');
}

@freezed
class NameAndPath with _$NameAndPath {
  const NameAndPath._();
  const factory NameAndPath(String name, String path) = _NameAndPath;
}
