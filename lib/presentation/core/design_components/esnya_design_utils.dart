import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:flutter/material.dart';

enum ShadowSize { none, small, large, largeUp }

Map<ShadowSize, BoxShadow?> _shadowMap = {
  ShadowSize.small: BoxShadow(
    color: esnyaColorsLight.shadow,
    spreadRadius: 0,
    blurRadius: 8,
    offset: Offset(0, 4), // changes position of shadow
  ),
  ShadowSize.large: BoxShadow(
    color: esnyaColorsLight.shadow,
    spreadRadius: 0,
    blurRadius: 16,
    offset: Offset(0, 8), // changes position of shadow
  ),
  ShadowSize.largeUp: BoxShadow(
    color: esnyaColorsLight.shadow,
    spreadRadius: 0,
    blurRadius: 16,
    offset: Offset(0, -8), // changes position of shadow
  ),
};

Widget shadowWrapLarge(child) => shadowWrap(ShadowSize.large, 0, child);
Widget shadowWrapLargeUp(child) => shadowWrap(ShadowSize.largeUp, 0, child);
Widget shadowWrapSmall(child) => shadowWrap(ShadowSize.small, 0, child);

Widget shadowWrap(ShadowSize shadowSize, double borderRadius, Widget child) =>
    shadowSize == ShadowSize.none
        ? child
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              boxShadow: [_shadowMap[shadowSize]!],
            ),
            child: child,
          );

ColorScheme getColorScheme(BuildContext context) =>
    Theme.of(context).colorScheme;

TextTheme getTextTheme(BuildContext context) => Theme.of(context).textTheme;

typedef GetColor = Color Function(ColorScheme c);
typedef GetTextStyle = TextStyle? Function(TextTheme t);
