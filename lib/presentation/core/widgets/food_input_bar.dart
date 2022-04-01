import 'package:flutter/material.dart';

class FoodInputBar extends StatefulWidget {
  final void Function(String) onChanged;
  final void Function(String) onSubmit;

  const FoodInputBar({
    Key? key,
    required this.onChanged,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<FoodInputBar> createState() => _FoodInputBarState();
}

class _FoodInputBarState extends State<FoodInputBar> {
  final _controller = TextEditingController();
  String _content = "";

  void _handleChange() {
    print(_controller.text.contains("\n"));
    setState(() {
      _content = _controller.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Expanded(
          child: TextField(
            // onEditingComplete: () {
            //   print("editing compete");
            // },
            // onSubmitted: (value) {
            //   print("submitteddddddd");
            // },
            textInputAction: TextInputAction.newline,
            onChanged: widget.onChanged,
            controller: _controller,
            decoration: const InputDecoration(
              // contentPadding: EdgeInsets.all(0),
              hintText: 'Type "300 oz of tomatoes300a"',
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              widget.onSubmit(_content);
              _controller.clear();
            },
            child: Text("check"))
      ]),
    );
  }
}
