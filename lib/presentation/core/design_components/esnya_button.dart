import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:flutter/material.dart';

class EsynaButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool disabled;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String title;
  final GetColor getColor;
  final GetColor getTextColor;
  final ButtonSize buttonSize;

  EsynaButton._({
    required this.title,
    required this.getColor,
    required this.getTextColor,
    this.onPressed,
    this.disabled = false,
    Key? key,
    this.leadingIcon,
    this.trailingIcon,
    this.buttonSize = ButtonSize.medium,
  }) : super(key: key);

  factory EsynaButton.primary({
    required String title,
    void Function()? onPressed,
    bool disabled = false,
    Key? key,
    IconData? leadingIcon,
    IconData? trailingIcon,
    ButtonSize buttonSize = ButtonSize.medium,
  }) =>
      EsynaButton._(
        onPressed: onPressed,
        title: title,
        getColor: (ColorScheme c) => c.primary,
        getTextColor: (ColorScheme c) => c.surface,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        buttonSize: buttonSize,
      );

  factory EsynaButton.secondary({
    required String title,
    void Function()? onPressed,
    bool disabled = false,
    Key? key,
    IconData? leadingIcon,
    IconData? trailingIcon,
    ButtonSize buttonSize = ButtonSize.medium,
  }) =>
      EsynaButton._(
        onPressed: onPressed,
        title: title,
        getColor: (ColorScheme c) => c.secondary,
        getTextColor: (ColorScheme c) => c.surface,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        buttonSize: buttonSize,
      );

  factory EsynaButton.surface({
    required String title,
    void Function()? onPressed,
    bool disabled = false,
    Key? key,
    IconData? leadingIcon,
    IconData? trailingIcon,
    ButtonSize buttonSize = ButtonSize.medium,
  }) =>
      EsynaButton._(
        onPressed: onPressed,
        title: title,
        getColor: (ColorScheme c) => c.surface,
        getTextColor: (ColorScheme c) => c.onSurface,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        buttonSize: buttonSize,
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final c = getColor(colorScheme);
    final tC = getTextColor(colorScheme);

    final paddingBetween = const {
      ButtonSize.small: 4.0,
      ButtonSize.medium: 4.0,
      ButtonSize.large: 8.0
    }[buttonSize]!;

    final borderRadius = const {
      ButtonSize.small: 6.0,
      ButtonSize.medium: 8.0,
      ButtonSize.large: 8.0
    }[buttonSize]!;

    final iconSize = const {
      ButtonSize.small: 12.0,
      ButtonSize.medium: 16.0,
      ButtonSize.large: 20.0
    }[buttonSize]!;

    final Offset padding = const {
      ButtonSize.small: Offset(6, 4),
      ButtonSize.medium: Offset(8, 4),
      ButtonSize.large: Offset(16, 4)
    }[buttonSize]!;

    final height = const {
      ButtonSize.small: 16.0,
      ButtonSize.medium: 24.0,
      ButtonSize.large: 32.0
    }[buttonSize]!;

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (leadingIcon != null)
          Padding(
              padding: EdgeInsets.only(right: paddingBetween),
              child: Icon(
                leadingIcon,
                size: iconSize,
                color: tC,
              )),
        EsnyaText(
          text: title,
          color: tC,
          getTextStyle: (c) => {
            ButtonSize.small: c.titleSmall,
            ButtonSize.medium: c.titleLarge,
            ButtonSize.large: c.headlineSmall
          }[buttonSize],
        ),
        if (trailingIcon != null)
          Padding(
              padding: EdgeInsets.only(left: paddingBetween),
              child: Icon(
                trailingIcon,
                size: iconSize,
                color: tC,
              )),
      ],
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: BorderSide.none,
    );

    return Shadow(
      MaterialButton(
        color: c,
        disabledColor:
            Color.lerp(c, const Color.fromARGB(255, 184, 184, 184), 0.5),
        padding: EdgeInsets.symmetric(
          vertical: padding.dy,
          horizontal: padding.dx,
        ),
        minWidth: 0,
        height: height,
        key: key,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: shape,
        onPressed: onPressed,
        child: child,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
      ),
      radius: borderRadius,
    );
  }
}
