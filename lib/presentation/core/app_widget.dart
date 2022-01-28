import 'package:esnya/presentation/core/constants.dart';
import 'package:flutter/material.dart';
import '../routes/router.gr.dart' as app_router;
import 'package:auto_route/auto_route.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final _rootRouter = app_router.AppRouter(
      // authGuard: AuthGuard(),
      );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeData,
      title: kAppName,
      debugShowCheckedModeBanner: false,
      routerDelegate: _rootRouter.delegate(),
      routeInformationProvider: _rootRouter.routeInfoProvider(),
      routeInformationParser: _rootRouter.defaultRouteParser(),
      builder: (_, router) {
        return router!;
      },
    );
  }
}
