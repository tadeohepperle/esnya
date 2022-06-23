import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';
import 'esnya_sizes.dart';

class EsnyaIconButton extends StatelessWidget {
  final IconData iconData;
  GetColor getColor;
  GetColor getIconColor;
  final ButtonSize buttonSize;
  bool shadow;

  final void Function()? onPressed;
  EsnyaIconButton._({
    Key? key,
    required this.iconData,
    this.onPressed,
    this.buttonSize = ButtonSize.medium,
    required this.getColor,
    required this.getIconColor,
    this.shadow = true,
  }) : super(key: key);

  factory EsnyaIconButton.primary(
    IconData iconData, {
    void Function()? onPressed,
    ButtonSize buttonSize = ButtonSize.medium,
  }) =>
      EsnyaIconButton._(
        iconData: iconData,
        onPressed: onPressed,
        getIconColor: (c) => c.primary,
        getColor: (c) => c.surface,
        buttonSize: buttonSize,
      );

  factory EsnyaIconButton.secondary(
    IconData iconData, {
    void Function()? onPressed,
    ButtonSize buttonSize = ButtonSize.medium,
  }) =>
      EsnyaIconButton._(
        iconData: iconData,
        onPressed: onPressed,
        getIconColor: (c) => c.secondary,
        getColor: (c) => c.surface,
        buttonSize: buttonSize,
      );

  factory EsnyaIconButton.surface(
    IconData iconData, {
    void Function()? onPressed,
    ButtonSize buttonSize = ButtonSize.medium,
  }) =>
      EsnyaIconButton._(
        iconData: iconData,
        onPressed: onPressed,
        getIconColor: (c) => c.onBackground,
        getColor: (c) => c.surface,
        buttonSize: buttonSize,
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final c = getColor(colorScheme);
    final iC = getIconColor(colorScheme);

    final padding = const {
      ButtonSize.small: 2.0,
      ButtonSize.medium: 4.0,
      ButtonSize.large: 4.0,
      ButtonSize.xxl: 8.0
    }[buttonSize]!;
    final iconSize = const {
      ButtonSize.small: 12.0,
      ButtonSize.medium: 16.0,
      ButtonSize.large: 24.0,
      ButtonSize.xxl: 36.0
    }[buttonSize]!;
    final borderRadius = const {
      ButtonSize.small: 4.0,
      ButtonSize.medium: 8.0,
      ButtonSize.large: 8.0,
      ButtonSize.xxl: 16.0
    }[buttonSize]!;

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: BorderSide.none,
    );

    // normal is 32 px high and wide, floating action is 48 high and wide.

    final button = MaterialButton(
      disabledColor: Color.lerp(c, colorScheme.background, 0.5),
      padding: EdgeInsets.all(padding),
      height: padding * 2 + iconSize,
      minWidth: 0,
      key: key,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: shape,
      onPressed: onPressed,
      child: Icon(
        iconData,
        size: iconSize,
        color: iC,
      ),
      color: c,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
    );
    return shadow
        ? Shadow(
            button,
            radius: borderRadius,
          )
        : button;
  }
}
