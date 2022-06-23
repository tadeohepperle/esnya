import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/widgets/food_input/food_input_bar.dart';
import 'package:flutter/material.dart';

class FoodInputBarScreen extends StatefulWidget {
  const FoodInputBarScreen({Key? key}) : super(key: key);

  @override
  State<FoodInputBarScreen> createState() => _FoodInputBarScreenState();
}

class _FoodInputBarScreenState extends State<FoodInputBarScreen> {
  String _text = '';
  String _unsavedText = '';
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(children: [
        EsynaButton.primary(
          title: "Clear",
          onPressed: () {
            setState(() {
              _text = '';
            });
          },
        ),
        Divider(),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          height: 200,
          child: Text(_text + _unsavedText),
        ),
        Divider(),
        FoodInputBar(
          focusNode: focusNode,
          onChanged: (v) {
            setState(() {
              _unsavedText = v;
            });
          },
          onSubmitted: (v) {
            setState(() {
              _text += _unsavedText + "\n";
              _unsavedText = '';
            });
          },
          onClosed: (v) {
            setState(() {
              _text += '\n Closed. \n';
              _unsavedText = '';
            });
          },
        )
      ]),
    ));
  }
}
