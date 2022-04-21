import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:flutter/material.dart';

import 'esnya_theme.dart';

class EsynaButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final GetColor getColor;
  final GetColor getTextColor;
  const EsynaButton._internal({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.getColor,
    required this.getTextColor,
  }) : super(key: key);

  factory EsynaButton.primary(
          {required void Function()? onPressed, required String text}) =>
      EsynaButton._internal(
        onPressed: onPressed,
        text: text,
        getColor: (ColorScheme c) => c.primary,
        getTextColor: (ColorScheme c) => c.surface,
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MaterialButton(
      key: key,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: EsnyaSizes.roundedRectangleBorder,
      onPressed: onPressed,
      child: Text("hashashsa"),
      color: getColor(colorScheme),
    );
  }
}
