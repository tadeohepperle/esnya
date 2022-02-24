// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../home_screen/home_screen_page.dart' as _i3;
import '../sign_in/sign_in_page.dart' as _i2;
import '../splash_screen/splash_screen_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreenPage());
    },
    SignInRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    HomeScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeScreenPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i4.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i4.RouteConfig(HomeScreenRoute.name, path: '/home-screen-page')
      ];
}

/// generated route for
/// [_i1.SplashScreenPage]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i4.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.HomeScreenPage]
class HomeScreenRoute extends _i4.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(HomeScreenRoute.name, path: '/home-screen-page');

  static const String name = 'HomeScreenRoute';
}
