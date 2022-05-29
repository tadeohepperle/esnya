import 'package:esnya/application/app_startup/cubit/app_startup_cubit.dart';
import 'package:esnya/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/auth/auth_bloc.dart';

/// tightly coupled to the progress of the AppStartupRepository through AppStartupBloc
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,

      /// double listening on AuthBloc and AppStartupState is necessary because we do not know what will be first:
      /// AppStartup done or get if user is authenticated or not.
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, authState) {
          final appStartupState = context.read<AppStartupCubit>().state;
          appStartupState.ifDone(() {
            authState.goHomeOrSignIn(context);
          });
        },
        child: BlocConsumer<AppStartupCubit, AppStartupState>(
          listener: (context, appStartupState) {
            /// when AppStartupState is done: check state of AuthBloc:
            /// authenticated -> send to home, unAuthenticated -> send to sign in

            appStartupState.ifDone(() {
              final authState = context.read<AuthBloc>().state;
              authState.goHomeOrSignIn(context);
            });
          },
          builder: (context, appStartupState) {
            return Center(
              child: Text(
                appStartupState.map(
                    initial: (_) => "initial",
                    inProgress: (_) => "inProgress: ${_.progress * 100}%",
                    done: (_) => "done",
                    failed: (_) => "failed"),
              ),
            );
          },
        ),
      ),
    );
  }
}

extension on AuthState {
  void goHomeOrSignIn(BuildContext context) {
    map(
      initial: (_) {},
      authenticated: (_) {
        context.go(AppRoutes.home.path);
      },
      unauthenticated: (_) {
        context.go(AppRoutes.signIn.path);
      },
    );
  }
}

extension on AppStartupState {
  ifDone(void Function() function) {
    maybeMap(
      done: (_) {
        function();
      },
      orElse: () {},
    );
  }
}
