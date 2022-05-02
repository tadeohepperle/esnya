import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:flutter/material.dart';

import '../design_components/esnya_design_utils.dart';

class NoEntriesYetListItem extends StatelessWidget {
  const NoEntriesYetListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    return shadowWrap(
      ShadowSize.large,
      EsnyaSizes.base,
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(EsnyaSizes.kFoodItemEntryListTileHeight / 2)),
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
