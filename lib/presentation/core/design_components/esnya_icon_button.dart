import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';
import 'esnya_sizes.dart';
import 'esnya_theme.dart';

class EsnyaIconButton extends StatelessWidget {
  final IconData iconData;
  final GetColor getColor;
  final GetColor getIconColor;
  final ShadowSize? shadowSize;
  final bool floatingActionStyle;

  final void Function()? onPressed;
  const EsnyaIconButton._internal({
    Key? key,
    required this.iconData,
    this.onPressed,
    this.shadowSize,
    required this.getColor,
    required this.getIconColor,
    this.floatingActionStyle = false,
  }) : super(key: key);

  factory EsnyaIconButton.primary(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
    bool? floatingActionStyle,
  }) =>
      EsnyaIconButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: (c) => c.surface,
        getColor: (c) => c.primary,
        floatingActionStyle: floatingActionStyle ?? false,
      );

  factory EsnyaIconButton.secondary(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
    bool? floatingActionStyle,
  }) =>
      EsnyaIconButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: (c) => c.surface,
        getColor: (c) => c.secondary,
        floatingActionStyle: floatingActionStyle ?? false,
      );

  factory EsnyaIconButton.surface(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
    bool? floatingActionStyle,
  }) =>
      EsnyaIconButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: (c) => c.primary,
        getColor: (c) => c.surface,
        floatingActionStyle: floatingActionStyle ?? false,
      );

  factory EsnyaIconButton.background(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
    bool? floatingActionStyle,
  }) =>
      EsnyaIconButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: (c) => c.onBackground,
        getColor: (c) => c.background,
        floatingActionStyle: floatingActionStyle ?? false,
      );

  factory EsnyaIconButton.custom(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
    GetColor? getIconColor,
    GetColor? getColor,
    bool? floatingActionStyle,
  }) =>
      EsnyaIconButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: getIconColor ?? (c) => c.onBackground,
        getColor: getColor ?? (c) => c.surface,
        floatingActionStyle: floatingActionStyle ?? false,
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
        padding: const EdgeInsets.all(EsnyaSizes.base / 2),
        height: 0,
        minWidth: 0,
        // elevation: 0,
        key: key,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: EsnyaSizes.roundedRectangleBorder,
        onPressed: onPressed,
        child: Icon(
          iconData,
          size: 20,
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
