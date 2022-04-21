import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';
import 'esnya_sizes.dart';
import 'esnya_theme.dart';

class EsnyaFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final GetColor getColor;
  final GetColor getIconColor;
  final ShadowSize? shadowSize;

  final void Function()? onPressed;
  const EsnyaFloatingActionButton._internal({
    Key? key,
    required this.iconData,
    this.onPressed,
    this.shadowSize,
    required this.getColor,
    required this.getIconColor,
  }) : super(key: key);

  factory EsnyaFloatingActionButton.primary(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
  }) =>
      EsnyaFloatingActionButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: (c) => c.surface,
        getColor: (c) => c.primary,
      );

  factory EsnyaFloatingActionButton.secondary(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
  }) =>
      EsnyaFloatingActionButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: (c) => c.surface,
        getColor: (c) => c.secondary,
      );

  factory EsnyaFloatingActionButton.surface(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
  }) =>
      EsnyaFloatingActionButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: (c) => c.primary,
        getColor: (c) => c.surface,
      );

  factory EsnyaFloatingActionButton.background(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
  }) =>
      EsnyaFloatingActionButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: (c) => c.onBackground,
        getColor: (c) => c.background,
      );

  factory EsnyaFloatingActionButton.custom(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
    GetColor? getIconColor,
    GetColor? getColor,
  }) =>
      EsnyaFloatingActionButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: getIconColor ?? (c) => c.onBackground,
        getColor: getColor ?? (c) => c.surface,
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final c = getColor(colorScheme);
    final iC = getIconColor(colorScheme);

    return shadowWrap(
      shadowSize ?? ShadowSize.large,
      MaterialButton(
        disabledColor:
            Color.lerp(c, const Color.fromARGB(255, 184, 184, 184), 0.5),
        padding: const EdgeInsets.all(6),
        minWidth: EsnyaSizes.base * 4,
        height: 0,
        // elevation: 0,
        key: key,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide.none,
        ),
        onPressed: onPressed,
        child: Icon(
          iconData,
          size: 36,
          color: iC,
        ),
        color: c,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
      ),
    );
  }
}
