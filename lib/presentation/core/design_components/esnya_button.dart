import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:flutter/material.dart';

class EsynaButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool disabled;
  final IconData? iconData;
  final String title;
  final GetColor getColor;
  final GetColor getTextColor;
  final ShadowSize? shadowSize;
  final EdgeInsetsGeometry? customPadding;
  final double? customPaddingBetweenIconAndText;

  const EsynaButton._internal(
      {required this.title,
      required this.getColor,
      required this.getTextColor,
      Key? key,
      this.onPressed,
      this.disabled = false, // TODO: not implemented yet
      this.iconData,
      this.shadowSize,
      this.customPadding,
      this.customPaddingBetweenIconAndText})
      : super(key: key);

  factory EsynaButton.primary({
    required String title,
    void Function()? onPressed,
    IconData? iconData,
    ShadowSize? shadowSize,
  }) =>
      EsynaButton._internal(
        onPressed: onPressed,
        title: title,
        getColor: (ColorScheme c) => c.primary,
        getTextColor: (ColorScheme c) => c.surface,
        iconData: iconData,
        shadowSize: shadowSize,
      );

  factory EsynaButton.secondary({
    required String title,
    void Function()? onPressed,
    IconData? iconData,
    ShadowSize? shadowSize,
  }) =>
      EsynaButton._internal(
        onPressed: onPressed,
        title: title,
        getColor: (ColorScheme c) => c.secondary,
        getTextColor: (ColorScheme c) => c.surface,
        iconData: iconData,
        shadowSize: shadowSize,
      );

  factory EsynaButton.surface({
    required String title,
    void Function()? onPressed,
    IconData? iconData,
    ShadowSize? shadowSize,
  }) =>
      EsynaButton._internal(
        onPressed: onPressed,
        title: title,
        getColor: (ColorScheme c) => c.surface,
        getTextColor: (ColorScheme c) => c.primary,
        iconData: iconData,
        shadowSize: shadowSize,
      );

  factory EsynaButton.background({
    required String title,
    void Function()? onPressed,
    IconData? iconData,
    ShadowSize? shadowSize,
  }) =>
      EsynaButton._internal(
        onPressed: onPressed,
        title: title,
        getColor: (ColorScheme c) => c.background,
        getTextColor: (ColorScheme c) => c.onBackground,
        iconData: iconData,
        shadowSize: shadowSize,
      );

  factory EsynaButton.custom(
          {required String title,
          void Function()? onPressed,
          IconData? iconData,
          ShadowSize? shadowSize,
          GetColor? getColor,
          GetColor? getTextColor,
          EdgeInsetsGeometry? customPadding,
          double? customPaddingBetweenIconAndText}) =>
      EsynaButton._internal(
        onPressed: onPressed,
        title: title,
        getColor: getColor ?? (c) => c.surface,
        getTextColor: getTextColor ?? (c) => c.onBackground,
        iconData: iconData,
        shadowSize: shadowSize,
        customPadding: customPadding,
        customPaddingBetweenIconAndText: customPaddingBetweenIconAndText,
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final c = getColor(colorScheme);
    final tC = getTextColor(colorScheme);
    Widget child = EsnyaText.title(
      title,
      color: tC,
    );
    if (iconData != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  right: customPaddingBetweenIconAndText ?? EsnyaSizes.base),
              child: Icon(
                iconData,
                size: 20,
                color: tC,
              )),
          child
        ],
      );
    }
    return shadowWrap(
      shadowSize ?? ShadowSize.large,
      MaterialButton(
        color: c,
        disabledColor:
            Color.lerp(c, const Color.fromARGB(255, 184, 184, 184), 0.5),
        padding: customPadding ??
            EdgeInsets.symmetric(
                vertical: (iconData == null ? 8.0 : 6.0),
                horizontal: EsnyaSizes.base * 2),
        minWidth: EsnyaSizes.base * 4,
        height: 0,
        key: key,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: EsnyaSizes.roundedRectangleBorder,
        onPressed: onPressed,
        child: child,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
      ),
    );
  }
}
