import 'package:flutter/material.dart';

import '../../design_components/esnya_design_utils.dart';
import '../../design_components/esnya_icons.dart';
import '../../design_components/esnya_sizes.dart';
import '../../design_components/esnya_text.dart';

class NoEntriesYetListItem extends StatelessWidget {
  const NoEntriesYetListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    return Shadow(
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: colorScheme.surface),
        height: EsnyaSizes.kNoEntriesYetListItemHeight,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(EsnyaIcons.info),
            EsnyaText.titleBold("No entries yet"),
            EsnyaText.body(
              "Use the buttons below to add your food\n via text or microphone",
              textAlign: TextAlign.center,
              color: colorScheme.onBackground,
            )
          ],
        ),
      ),
    );
  }
}
