import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';

class EsnyaText extends StatelessWidget {
  final String text;
  final GetTextStyle? getTextStyle;
  final GetColor? getColor;
  final Color?
      color; // color has priority over getColor if both are set. This is not encouraged.
  const EsnyaText._internal(
      {Key? key,
      required this.text,
      this.getColor,
      this.color,
      this.getTextStyle})
      : super(key: key);

  factory EsnyaText.h1(String text, {Color? color, GetColor? getColor}) =>
      EsnyaText._internal(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.headlineLarge,
      );

  factory EsnyaText.h2(String text, {Color? color, GetColor? getColor}) =>
      EsnyaText._internal(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.headlineMedium,
      );

  factory EsnyaText.h3(String text, {Color? color, GetColor? getColor}) =>
      EsnyaText._internal(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.headlineSmall,
      );

  factory EsnyaText.body(String text, {Color? color, GetColor? getColor}) =>
      EsnyaText._internal(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.bodyMedium,
      );

  factory EsnyaText.bodySmall(String text,
          {Color? color, GetColor? getColor}) =>
      EsnyaText._internal(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.bodySmall,
      );

  factory EsnyaText.titleBold(String text,
          {Color? color, GetColor? getColor}) =>
      EsnyaText._internal(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.titleLarge,
      );

  factory EsnyaText.title(String text, {Color? color, GetColor? getColor}) =>
      EsnyaText._internal(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.titleMedium,
      );

  factory EsnyaText.titleSmall(String text,
          {Color? color, GetColor? getColor}) =>
      EsnyaText._internal(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.titleSmall,
      );

  @override
  Widget build(BuildContext context) {
    TextStyle? tS =
        getTextStyle != null ? getTextStyle!(getTextTheme(context)) : null;
    final Color? c =
        color ?? (getColor != null ? getColor!(getColorScheme(context)) : null);
    if (c != null) {
      tS = (tS ?? const TextStyle()).copyWith(color: c);
    }
    return Text(text, style: tS);
  }
}
