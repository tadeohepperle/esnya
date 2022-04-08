import 'package:flutter/material.dart';

class FoodInputBar extends StatefulWidget {
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final void Function(String) onClosed;
  const FoodInputBar({
    Key? key,
    required this.onChanged,
    required this.onSubmitted,
    required this.onClosed,
  }) : super(key: key);

  static const kFoodInputBarHeight = 60.0;

  @override
  State<FoodInputBar> createState() => _FoodInputBarState();

  void focus() {}
}

class _FoodInputBarState extends State<FoodInputBar> {
  final _controller = TextEditingController();
  late FocusNode _focusNode;
  String _content = "";

  void _handleChange() {
    setState(() {
      _content = _controller.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
    _controller.addListener(_handleChange);
  }

  @override
  void dispose() {
    // _focusNode.unfocus();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      height: FoodInputBar.kFoodInputBarHeight,
      child: Row(children: [
        Expanded(
          child: TextField(
            onChanged: widget.onChanged,
            onSubmitted: widget.onClosed,
            focusNode: _focusNode,
            textInputAction: TextInputAction.done,
            controller: _controller,
            decoration: const InputDecoration(
              // contentPadding: EdgeInsets.all(0),
              hintText: 'Type "300 oz of tomatoes300a"',
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              widget.onSubmitted(_content);
              _controller.clear();
            },
            child: Icon(Icons.add))
      ]),
    );
  }
}
