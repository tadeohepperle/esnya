import 'package:auto_route/auto_route.dart';
import 'package:esnya/application/auth/auth_bloc.dart';
import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/routes/router.gr.dart';
import 'package:esnya/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/snackbar/snackbar_util.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print(state);
        state.map(initial: (_) {
          showSnackBar(context, "AuthState: initial");
        }, authenticated: (_) {
          showSnackBar(context, "AuthState: authenticated");
        }, unauthenticated: (_) {
          showSnackBar(context, "AuthState: unauthenticated");
          print("UNANDIAAIASAS");
          context.router.replace(SignInRoute());
        });
      },
      builder: (context, state) {
        final authBloc = context.read<AuthBloc>();
        print(authBloc.state);

        return Scaffold(
          appBar: AppBar(
            actions: [
              ElevatedButton(
                  onPressed: () {
                    authBloc.add(AuthEvent.signedOut());
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

    // BlocConsumer(
    //   child: Scaffold(
    //       appBar: AppBar(
    //         actions: [ElevatedButton(onPressed: () {
    //           context.read<SignInFormBloc>();
    //         }, child: Text("Logout"))],
    //       ),
    //       body: Container(
    //         child: Padding(
    //           padding: const EdgeInsets.all(40),
    //           child: Text("Home Screen"),
    //         ),
    //       )),
    // );
  }
}
