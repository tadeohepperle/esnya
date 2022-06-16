import 'package:flutter/material.dart';

import 'esnya_design_utils.dart';

class EsnyaText extends StatelessWidget {
  final String text;
  // ignore: prefer_function_declarations_over_variables
  final GetTextStyle? getTextStyle;
  final GetColor? getColor;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;

  const EsnyaText._({
    Key? key,
    required this.text,
    this.getColor,
    this.color,
    this.getTextStyle,
    this.overflow,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);

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

  factory EsnyaText.body(
    String text, {
    Key? key,
    GetColor? getColor,
    Color? color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) =>
      EsnyaText._(
        text: text,
        key: key,
        getColor: getColor,
        color: color,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        getTextStyle: (t) => t.bodyMedium,
      );

  factory EsnyaText.bodySmall(
    String text, {
    Key? key,
    GetColor? getColor,
    Color? color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) =>
      EsnyaText._(
        text: text,
        key: key,
        getColor: getColor,
        color: color,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        getTextStyle: (t) => t.bodySmall,
      );

  factory EsnyaText.titleBold(
    String text, {
    Key? key,
    GetColor? getColor,
    Color? color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) =>
      EsnyaText._(
        text: text,
        key: key,
        getColor: getColor,
        color: color,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        getTextStyle: (t) => t.titleLarge,
      );

  factory EsnyaText.title(
    String text, {
    Key? key,
    GetColor? getColor,
    Color? color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) =>
      EsnyaText._(
        text: text,
        key: key,
        getColor: getColor,
        color: color,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        getTextStyle: (t) => t.titleMedium,
      );

  factory EsnyaText.titleSmall(
    String text, {
    Key? key,
    GetColor? getColor,
    Color? color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) =>
      EsnyaText._(
        text: text,
        key: key,
        getColor: getColor,
        color: color,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        getTextStyle: (t) => t.titleSmall,
      );

  factory EsnyaText.h1(
    String text, {
    Key? key,
    GetColor? getColor,
    Color? color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) =>
      EsnyaText._(
        text: text,
        key: key,
        getColor: getColor,
        color: color,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        getTextStyle: (t) => t.headlineLarge,
      );

  factory EsnyaText.h2(
    String text, {
    Key? key,
    GetColor? getColor,
    Color? color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) =>
      EsnyaText._(
        text: text,
        key: key,
        getColor: getColor,
        color: color,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        getTextStyle: (t) => t.headlineMedium,
      );

  factory EsnyaText.h3(
    String text, {
    Key? key,
    GetColor? getColor,
    Color? color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) =>
      EsnyaText._(
        text: text,
        key: key,
        getColor: getColor,
        color: color,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        getTextStyle: (t) => t.headlineSmall,
      );
}
