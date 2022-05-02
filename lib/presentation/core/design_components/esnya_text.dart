import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';

class EsnyaText extends StatelessWidget {
  final String text;
  final GetTextStyle? getTextStyle;
  final GetColor? getColor;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  // color has priority over getColor if both are set. This is not encouraged.
  const EsnyaText.custom({
    Key? key,
    required this.text,
    this.getColor,
    this.color,
    this.getTextStyle,
    this.overflow,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);

  factory EsnyaText.h1(
    String text, {
    Color? color,
    GetColor? getColor,
    TextAlign? textAlign,
  }) =>
      EsnyaText.custom(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.headlineLarge,
        textAlign: textAlign,
      );

  factory EsnyaText.h2(
    String text, {
    Color? color,
    GetColor? getColor,
    TextAlign? textAlign,
  }) =>
      EsnyaText.custom(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.headlineMedium,
        textAlign: textAlign,
      );

  factory EsnyaText.h3(
    String text, {
    Color? color,
    GetColor? getColor,
    TextAlign? textAlign,
  }) =>
      EsnyaText.custom(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.headlineSmall,
        textAlign: textAlign,
      );

  factory EsnyaText.body(
    String text, {
    Color? color,
    GetColor? getColor,
    TextAlign? textAlign,
  }) =>
      EsnyaText.custom(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.bodyMedium,
        textAlign: textAlign,
      );

  factory EsnyaText.bodySmall(
    String text, {
    Color? color,
    GetColor? getColor,
    TextAlign? textAlign,
  }) =>
      EsnyaText.custom(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.bodySmall,
        textAlign: textAlign,
      );

  factory EsnyaText.titleBold(
    String text, {
    Color? color,
    GetColor? getColor,
    TextAlign? textAlign,
  }) =>
      EsnyaText.custom(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.titleLarge,
        textAlign: textAlign,
      );

  factory EsnyaText.title(
    String text, {
    Color? color,
    GetColor? getColor,
    TextAlign? textAlign,
  }) =>
      EsnyaText.custom(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.titleMedium,
        textAlign: textAlign,
      );

  factory EsnyaText.titleSmall(
    String text, {
    Color? color,
    GetColor? getColor,
    TextAlign? textAlign,
  }) =>
      EsnyaText.custom(
        text: text,
        color: color,
        getColor: getColor,
        getTextStyle: (t) => t.titleSmall,
        textAlign: textAlign,
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
    return Text(
      text,
      style: tS,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
