import 'package:esnya/application/auth/auth_bloc.dart';
import 'package:esnya/presentation/core/constants.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';

final _formKey = GlobalKey<FormState>();

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
        listener: listenBloc, builder: buildBloc);
  }

  listenBloc(BuildContext context, SignInFormState state) {
    state.authFailureOrSuccessOption.fold(
      () {
        print("authFailureOrSuccessOption: none");
      },
      (either) => either.fold(
        (failure) {
          final failureMessage = failure.map(
            cancelledByUser: (_) => 'Cancelled by User',
            serverError: (_) => 'Server error',
            emailAlreadyInUse: (_) => 'Email already in use',
            invalidEmailAndPasswordCombination: (_) =>
                'Invalid email and password combination',
          );
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(failureMessage),
          ));
        },
        (_) {
          context.go(AppRoutes.home.path);
          context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
        },
      ),
    );
  }

  Widget buildBloc(BuildContext context, SignInFormState state) {
    final l10ns = AppLocalizations.of(context)!;
    final bloc = context.read<SignInFormBloc>();
    final autovalidateMode = state.showErrorMessages
        ? AutovalidateMode.always
        : AutovalidateMode.disabled;
    return Padding(
      padding: EdgeInsetsX.allLarge,
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '🍏',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 130),
                ),
              ),
              SizedBoxX.hSmall,
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "enter Email",
                  labelText: "Email",
                ),
                onChanged: (value) {
                  bloc.add(SignInFormEvent.emailChanged(value));
                },
                autocorrect: false,
                autovalidateMode: autovalidateMode,
                validator: (value) {
                  return bloc.state.emailAddress.value.fold(
                      (l) => l.maybeMap(
                          invalidEmail: (_) => "Invalid Email",
                          orElse: () => null),
                      (_) => null);
                },
              ),
              SizedBoxX.hSmall,
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: "enter Password",
                  labelText: "Password",
                ),
                onChanged: (value) {
                  bloc.add(SignInFormEvent.passwordChanged(value));
                },
                autocorrect: false,
                obscureText: true,
                autovalidateMode: autovalidateMode,
                validator: (value) {
                  return bloc.state.password.value.fold(
                      (l) => l.maybeMap(
                          invalidPassword: (_) => "Invalid Password",
                          orElse: () => null),
                      (r) => null);
                },
              ),
              SizedBoxX.hSmall,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(l10ns.login_button_text),
                      onPressed: () {
                        bloc.add(
                          const SignInFormEvent
                              .signInWithEmailAndPasswordPressed(),
                        );
                      },
                    ),
                  ),
                  SizedBoxX.wSmall,
                  Expanded(
                    child: ElevatedButton(
                      child: Text(l10ns.register_button_text),
                      onPressed: () {
                        bloc.add(
                          const SignInFormEvent
                              .registerWithEmailAndPasswordPressed(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(l10ns.googleauth_button_text),
                      onPressed: () {
                        bloc.add(
                          const SignInFormEvent.signInWithGooglePressed(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.isSubmitting)
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator()),
                    )
                ],
              )
            ],
          )),
    );
  }
}
