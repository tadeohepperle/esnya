import '../routes/app_router.dart';
import 'package:esnya_shared_resources/language/models/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../application/app_startup/cubit/app_startup_cubit.dart';
import '../../application/auth/auth_bloc.dart';
import '../../injection.dart';
import 'core.dart';
import 'design_components/esnya_theme.dart';

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
        ),
        BlocProvider(
          create: (context) => getIt<AppStartupCubit>(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate
        ],
        supportedLocales: [
          for (var l in Language.languages) Locale(l.languageCode)
        ],
        theme: themeDataLight,
        title: kAppName,
        debugShowCheckedModeBanner: false,
        routerDelegate: _rootRouter.routerDelegate,
        routeInformationParser: _rootRouter.routeInformationParser,
        builder: (_, router) {
          return router!;
        },
      ),
    );
  }
}
