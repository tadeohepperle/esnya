import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:flutter/material.dart';

import '../../design_components/esnya_design_utils.dart';
import '../../design_components/esnya_icons.dart';
import 'food_input_bar_controller.dart';

class FoodInputBar extends StatefulWidget {
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final void Function(String) onClosed;
  final FocusNode focusNode;

  const FoodInputBar({
    Key? key,
    required this.onChanged,
    required this.onSubmitted,
    required this.onClosed,
    required this.focusNode,
  }) : super(key: key);

  static const kFoodInputBarHeight = 36.0;

  @override
  State<FoodInputBar> createState() => _FoodInputBarState();

  void focus() {}
}

class _FoodInputBarState extends State<FoodInputBar> {
  final _controller = TextEditingController();
  String _content = "";

  void _handleChange() {
    setState(() {
      _content = _controller.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleChange);
    widget.focusNode.requestFocus();
  }

  @override
  void dispose() {
    widget.focusNode.unfocus();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final textTheme = getTextTheme(context);

    Widget _buildInput() => Shadow(
          Container(
            height: 32,
            child: TextField(
              onChanged: widget.onChanged,
              onSubmitted: widget.onClosed,
              focusNode: widget.focusNode,
              textInputAction: TextInputAction.done,
              controller: _controller,
              clipBehavior: Clip.antiAlias,
              maxLines: 1,
              style: textTheme.titleLarge,
              textAlignVertical: TextAlignVertical.top,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                fillColor: colorScheme.surface,
                contentPadding: EdgeInsets.only(
                  left: EsnyaSizes.base * 2,
                  right: EsnyaSizes.base * 2 + 32,
                ),
                hintText: '200 g of kidney beans',
              ),
            ),
          ),
        );

    Widget _buildButton() => EsnyaIconButton.surface(
          EsnyaIcons.check,
          onPressed: () {
            widget.onSubmitted(_content);
            _controller.clear();
          },
          buttonSize: ButtonSize.large,
        )
          ..getIconColor = ((c) => c.primary)
          ..shadow = false;

    return Container(
      height: 50,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: _buildInput()),
            ],
          ),
          Positioned(
            child: Shadow(_buildButton()),
            right: 0,
            top: 9,
          ),
        ],
      ),
    );
  }
}
