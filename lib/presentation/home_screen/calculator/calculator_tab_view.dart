import 'package:flutter/material.dart';

class CalculatorTabView extends StatefulWidget {
  const CalculatorTabView({Key? key}) : super(key: key);

  @override
  State<CalculatorTabView> createState() => _CalculatorTabViewState();
}

class _CalculatorTabViewState extends State<CalculatorTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
