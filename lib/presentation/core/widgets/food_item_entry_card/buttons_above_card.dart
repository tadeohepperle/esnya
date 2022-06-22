import '../../core.dart';

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
        EsnyaIconButton.surface(
          EsnyaIcons.delete,
          onPressed: onDeleteButtonClick,
        ),
        EsnyaSizes.spaceBaseWidth,
        EsnyaIconButton.surface(
          EsnyaIcons.close,
          onPressed: onCloseButtonClick,
        ),
      ],
    );
  }
}
