import 'package:esnya/presentation/core/core.dart';

import '../../design_components/esnya_design_utils.dart';
import '../../design_components/esnya_icon_button.dart';
import '../../design_components/esnya_icons.dart';
import '../../design_components/esnya_sizes.dart';

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
        EsnyaIconButton.custom(
          EsnyaIcons.delete,
          onPressed: onDeleteButtonClick,
          getColor: (c) => c.surface,
          getIconColor: (c) => c.secondary,
          shadowSize: ShadowSize.small,
        ),
        EsnyaSizes.spaceBaseWidth,
        EsnyaIconButton.custom(
          EsnyaIcons.close,
          onPressed: onCloseButtonClick,
          getColor: (c) => c.surface,
          getIconColor: (c) => c.onSurface,
          shadowSize: ShadowSize.small,
        ),
      ],
    );
  }
}
