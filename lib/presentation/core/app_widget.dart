import 'package:esnya/presentation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/auth_bloc.dart';
import '../../injection.dart';
import '../routes/router.gr.dart' as app_router;

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final _rootRouter = app_router.AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
          )
        ],
        child: MaterialApp.router(
          theme: themeData,
          title: kAppName,
          debugShowCheckedModeBanner: false,
          routerDelegate: _rootRouter.delegate(),
          routeInformationProvider: _rootRouter.routeInfoProvider(),
          routeInformationParser: _rootRouter.defaultRouteParser(),
          builder: (_, router) {
            return router!;
          },
        ));
  }
}
