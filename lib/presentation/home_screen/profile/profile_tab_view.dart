import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';

class ProfileTabView extends StatefulWidget {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  State<ProfileTabView> createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: EsynaButton.custom(
            title: "Logout",
            getColor: (c) => c.error,
            getTextColor: (c) => c.surface,
            onPressed: () {
              context.read<AuthBloc>().add(AuthEvent.signedOut());
            },
          ),
        ),
        ...List.generate(
          30,
          (index) => ListTile(
            title: Text("Calculator Tab view"),
            textColor: [
              Colors.red,
              Colors.black,
              Colors.amber,
              Colors.green
            ][index % 4],
          ),
        )
      ],
    );
  }
}
