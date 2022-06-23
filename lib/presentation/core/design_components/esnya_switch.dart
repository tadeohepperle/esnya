import 'esnya_design_utils.dart';
import 'esnya_icons.dart';
import 'esnya_sizes.dart';
import 'esnya_text.dart';

import '../core.dart';

class EsnyaSwitch extends StatelessWidget {
  final bool value;
  final String leftText;
  final String rightText;
  final GetColor getLeftColor;
  final GetColor getRightColor;
  final GetColor getDeactivatedColor;
  final Function(bool value)? onChange;
  EsnyaSwitch({
    required this.value,
    required this.leftText,
    required this.rightText,
    Key? key,
    GetColor? getLeftColor,
    GetColor? getRightColor,
    GetColor? getDeactivatedColor,
    this.onChange,
  })  : getLeftColor = getLeftColor ?? ((c) => c.primary),
        getRightColor = getRightColor ?? ((c) => c.primary),
        getDeactivatedColor = getDeactivatedColor ?? ((c) => c.onBackground),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final deactivatedColor = getDeactivatedColor(colorScheme);
    final leftColor = !value ? getLeftColor(colorScheme) : deactivatedColor;
    final rightColor = value ? getRightColor(colorScheme) : deactivatedColor;
    final padding = EdgeInsets.symmetric(vertical: 4, horizontal: 8);

    return Shadow(
      Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: EsnyaSizes.borderRadius,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              color: colorScheme.surface,
              disabledColor: colorScheme.surface,
              padding: padding,
              minWidth: 0,
              height: 32,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: !value
                      ? BorderSide(color: leftColor, width: 3)
                      : BorderSide.none),
              onPressed: onChange != null ? () => onChange!(false) : null,
              child: EsnyaText.titleBold(
                leftText,
                color: leftColor,
              ),
              elevation: 0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
            ),
            MaterialButton(
              color: colorScheme.surface,
              disabledColor: colorScheme.surface,
              padding: padding,
              minWidth: 0,
              height: 32,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: value
                      ? BorderSide(color: rightColor, width: 3)
                      : BorderSide.none),
              onPressed: onChange != null ? () => onChange!(true) : null,
              child: EsnyaText.titleBold(
                rightText,
                color: rightColor,
              ),
              elevation: 0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
