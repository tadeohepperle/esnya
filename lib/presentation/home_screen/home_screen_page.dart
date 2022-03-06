import 'package:esnya/application/auth/auth_bloc.dart';
import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/snackbar/snackbar_util.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(initial: (_) {
          showSnackBar(context, "AuthState: initial");
        }, authenticated: (_) {
          showSnackBar(context, "AuthState: authenticated");
        }, unauthenticated: (_) {
          showSnackBar(context, "AuthState: unauthenticated");
          context.go(AppRoutes.signIn.path);
        });
      },
      builder: (context, state) {
        final authBloc = context.read<AuthBloc>();
        return Scaffold(
          appBar: AppBar(
            actions: [
              ElevatedButton(
                  onPressed: () {
                    authBloc.add(const AuthEvent.signedOut());
                  },
                  child: Text("Logout"))
            ],
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: ElevatedButton(
                child: Text("print user string"),
                onPressed: () async {
                  print(context.read<AuthBloc>().state);
                  final userOption =
                      await getIt<AuthRepository>().getSignedInUser();
                  final str =
                      userOption.fold(() => "no user", (u) => u.toString());
                  print(str);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
