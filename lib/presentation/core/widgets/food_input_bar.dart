import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:flutter/material.dart';

import '../design_components/esnya_design_utils.dart';
import '../design_components/esnya_icons.dart';

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

  static const kFoodInputBarHeight = 36.0;

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
    final colorScheme = getColorScheme(context);
    final textTheme = getTextTheme(context);

    Widget _buildInput() => shadowWrapLarge(Container(
          height: 36,
          child: TextField(
            onChanged: widget.onChanged,
            onSubmitted: widget.onClosed,
            focusNode: _focusNode,
            textInputAction: TextInputAction.done,
            controller: _controller,
            clipBehavior: Clip.antiAlias,
            maxLines: 1,
            style: textTheme.titleLarge,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              fillColor: colorScheme.surface,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: EsnyaSizes.base * 2),
              hintText: 'Search',
            ),
          ),
        ));
    Widget _buildButton() => shadowWrapLarge(
          MaterialButton(
            onPressed: () {
              widget.onSubmitted(_content);
              _controller.clear();
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            height: 36,
            padding: const EdgeInsets.all(4),
            minWidth: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              side: BorderSide.none,
            ),
            color: colorScheme.primary,
            disabledColor: colorScheme.surface,
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            child: Icon(
              EsnyaIcons.check,
              size: 28,
              color: colorScheme.surface,
            ),
          ),
        );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: _buildInput()),
        Padding(
          padding: const EdgeInsets.only(left: EsnyaSizes.base),
          child: _buildButton(),
        )
      ],
    );
  }
}
