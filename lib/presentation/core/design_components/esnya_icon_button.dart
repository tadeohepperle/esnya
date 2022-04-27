import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';
import 'esnya_sizes.dart';

class EsnyaIconButton extends StatelessWidget {
  final IconData iconData;
  final GetColor getColor;
  final GetColor getIconColor;
  final ShadowSize? shadowSize;
  final bool floatingActionStyle;
  final double? customIconSize;
  final EdgeInsetsGeometry? customPadding;
  final double borderRadius;

  final void Function()? onPressed;
  EsnyaIconButton._internal(
      {Key? key,
      required this.iconData,
      this.onPressed,
      this.shadowSize,
      required this.getColor,
      required this.getIconColor,
      this.floatingActionStyle = false,
      this.customPadding,
      this.customIconSize,
      double? borderRadius})
      : borderRadius = borderRadius ?? (floatingActionStyle ? 24 : 8),
        super(key: key);

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

  /// customIconSize: standard is 20 for normal and 36 for floating action button
  factory EsnyaIconButton.custom(
    IconData iconData, {
    void Function()? onPressed,
    ShadowSize? shadowSize,
    GetColor? getIconColor,
    GetColor? getColor,
    bool? floatingActionStyle,
    double? customIconSize,
    EdgeInsetsGeometry? customPadding,
    double? borderRadius,
  }) =>
      EsnyaIconButton._internal(
        iconData: iconData,
        onPressed: onPressed,
        shadowSize: shadowSize,
        getIconColor: getIconColor ?? (c) => c.onBackground,
        getColor: getColor ?? (c) => c.surface,
        floatingActionStyle: floatingActionStyle ?? false,
        customIconSize: customIconSize,
        customPadding: customPadding,
        borderRadius: borderRadius,
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final c = getColor(colorScheme);
    final iC = getIconColor(colorScheme);

    final padding = customPadding ??
        (floatingActionStyle
            ? EdgeInsets.all(
                customIconSize != null ? (48 - customIconSize!) / 2 : 6)
            : EdgeInsets.all(
                customIconSize != null ? (32 - customIconSize!) / 2 : 6));
    final iconSize = floatingActionStyle
        ? (customIconSize ?? 36.0)
        : (customIconSize ?? 20.0);

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: BorderSide.none,
    );

    // normal is 32 px high and wide, floating action is 48 high and wide.
    return shadowWrap(
      shadowSize ?? ShadowSize.large,
      borderRadius,
      MaterialButton(
        disabledColor:
            Color.lerp(c, const Color.fromARGB(255, 184, 184, 184), 0.5),
        padding: padding,
        height: 0,
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
      ),
    );
  }
}
