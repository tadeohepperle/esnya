import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/presentation/error_screen.dart/error_screen_page.dart';
import 'package:esnya/presentation/home_screen/home_screen_page.dart';
import 'package:esnya/presentation/sign_in_screen/sign_in_screen_page.dart';
import 'package:esnya/presentation/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'app_router.freezed.dart';

@LazySingleton()
class AppRouter {
  AuthRepository authRepository;
  GoRouter _router;
  @override
  RouteInformationParser<Object> get routeInformationParser =>
      _router.routeInformationParser;

  @override
  RouterDelegate<Object> get routerDelegate => _router.routerDelegate;

  AppRouter(this.authRepository)
      : _router = GoRouter(
          redirect: (state) {
            final isSignedIn = authRepository.isSignedIn();
            final isGoingToSignIn = state.location == AppRoutes.signIn.path;
            if (!isGoingToSignIn && !isSignedIn) {
              return AppRoutes.signIn.path;
            }
            return null;
          },
          routes: [
            GoRoute(
              name: AppRoutes.splash.name,
              path: AppRoutes.splash.path,
              builder: (context, state) => SplashScreenPage(),
            ),
            GoRoute(
              name: AppRoutes.signIn.name,
              path: AppRoutes.signIn.path,
              builder: (context, state) => SignInScreenPage(),
            ),
            GoRoute(
              name: AppRoutes.home.name,
              path: AppRoutes.home.path,
              builder: (context, state) => HomeScreenPage(),
            )
          ],
          errorBuilder: (context, state) => ErrorScreenPage(),
        );
}

class AppRoutes {
  static const NameAndPath splash = NameAndPath('splash', '/splash');
  static const NameAndPath signIn = NameAndPath('sign-in', '/sign-in');
  static const NameAndPath home = NameAndPath('home', '/');
}

@freezed
class NameAndPath with _$NameAndPath {
  const NameAndPath._();
  const factory NameAndPath(String name, String path) = _NameAndPath;
}
