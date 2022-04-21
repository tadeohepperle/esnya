import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:flutter/material.dart';

enum ShadowSize { none, small, large }

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
};

Widget shadowWrapLarge(child) => shadowWrap(ShadowSize.large, child);
Widget shadowWrapSmall(child) => shadowWrap(ShadowSize.small, child);

Widget shadowWrap(ShadowSize shadowSize, Widget child) =>
    shadowSize == ShadowSize.none
        ? child
        : Container(
            decoration: BoxDecoration(
              boxShadow: [_shadowMap[shadowSize]!],
            ),
            child: child,
          );
