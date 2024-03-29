import 'package:flutter/material.dart' hide kBottomNavigationBarHeight;

import '../design_components/esnya_design_utils.dart';
import '../design_components/esnya_sizes.dart';
import '../design_components/esnya_text.dart';

class BottomNavigationTab extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool active;
  const BottomNavigationTab({
    Key? key,
    required this.title,
    required this.iconData,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final color = active ? colorScheme.primary : colorScheme.onSurface;

    return SizedBox(
      height: EsnyaSizes.kEsnyaBottomNavigationTabHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: color,
            size: 20,
          ),
          EsnyaText.body(title, color: color),
        ],
      ),
    );
  }
}
