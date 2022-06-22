import 'dart:math';

import 'package:flutter/material.dart';

import 'esnya_sizes.dart';

class Shadow extends StatelessWidget {
  final Widget child;
  final double radius;
  const Shadow(this.child, {Key? key, this.radius = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: [
          BoxShadow(
            color: getColorScheme(context).shadow,
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

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
