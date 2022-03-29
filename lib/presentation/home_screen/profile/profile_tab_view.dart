import 'package:flutter/material.dart';

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
