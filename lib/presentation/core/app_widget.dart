import 'package:esnya/presentation/routes/app_router.dart';
import 'package:esnya_shared_resources/language/models/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../application/auth/auth_bloc.dart';
import '../../injection.dart';
import './core.dart';

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
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: [
            for (var l in Language.languages) Locale(l.languageCode)
          ],
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
