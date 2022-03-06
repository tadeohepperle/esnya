import 'package:esnya/presentation/core/constants.dart';
import 'package:esnya/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/auth_bloc.dart';
import '../../injection.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final _rootRouter = getIt<AppRouter>();
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
          routerDelegate: _rootRouter.routerDelegate,
          routeInformationParser: _rootRouter.routeInformationParser,
          builder: (_, router) {
            return router!;
          },
        ));
  }
}
