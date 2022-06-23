import 'package:flutter/material.dart';

import '../../core.dart';

class ButtonsAboveCard extends StatelessWidget {
  final VoidCallback? onDeleteButtonClick;
  final VoidCallback? onCloseButtonClick;
  const ButtonsAboveCard({
    Key? key,
    this.onDeleteButtonClick,
    this.onCloseButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        EsnyaIconButton.surface(
          EsnyaIcons.delete,
          onPressed: onDeleteButtonClick,
          buttonSize: ButtonSize.large,
        )..getIconColor = ((c) => c.error),
        EsnyaSizes.spaceBaseWidth,
        EsnyaIconButton.surface(
          EsnyaIcons.close,
          onPressed: onCloseButtonClick,
          buttonSize: ButtonSize.large,
        ),
      ],
    );
  }
}
