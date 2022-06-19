import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';

import '../core.dart';

/// TODO: incomplete!!!
class EsnyaIconSwitch extends StatelessWidget {
  final bool value;
  final IconData leftIcon;
  final IconData rightIcon;
  final GetColor getLeftColor;
  final GetColor getRightColor;
  final GetColor getDeactivatedColor;
  final Function(bool value)? onChange;
  const EsnyaIconSwitch(
      {Key? key,
      required this.value,
      required this.leftIcon,
      required this.rightIcon,
      required this.getLeftColor,
      required this.getRightColor,
      required this.getDeactivatedColor,
      this.onChange})
      : super(key: key);

  factory EsnyaIconSwitch.checkCross(
          {required bool value, Function(bool value)? onChange}) =>
      EsnyaIconSwitch(
        value: value,
        onChange: onChange,
        leftIcon: EsnyaIcons.close,
        rightIcon: EsnyaIcons.check,
        getLeftColor: (c) => c.error,
        getRightColor: (c) => c.primary,
        getDeactivatedColor: (c) => c.onBackground,
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    return Container(
      height: 32,
      decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Icon(leftIcon),
          ),
          Container(
            child: Icon(rightIcon),
          )
        ],
      ),
    );
  }
}
