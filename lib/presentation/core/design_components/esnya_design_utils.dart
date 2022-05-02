import 'dart:math';

import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'esnya_sizes.dart';

enum ShadowSize { none, small, large, largeUp }

Map<ShadowSize, BoxShadow?> _shadowMap = {
  ShadowSize.small: BoxShadow(
    color: esnyaColorsLight.shadow,
    spreadRadius: 0,
    blurRadius: 4,
    offset: Offset(0, 2), // changes position of shadow
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

/// makes the child widget cling to the top of the keyboard or the bottom of the screen.
/// required `resizeToAvoidBottomInset: false` on the scaffold
class KeyboardAligned extends StatelessWidget {
  final Widget child;

  /// default = kBottomNavigationBarHeight, can be removed on screen without the tab bar.
  final double bottomNavigationBarHeight;
  const KeyboardAligned({
    Key? key,
    required this.child,
    this.bottomNavigationBarHeight = EsnyaSizes.kEsnyaBottomNavigationBarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inset = MediaQuery.of(context).viewInsets.bottom;
    return Positioned(
      child: child,
      bottom: max(0, inset - bottomNavigationBarHeight),
      left: 0,
      right: 0,
    );
  }
}
