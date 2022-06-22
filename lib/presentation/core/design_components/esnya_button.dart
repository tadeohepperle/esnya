import 'esnya_design_utils.dart';
import 'esnya_sizes.dart';
import 'esnya_text.dart';
import 'package:flutter/material.dart';

class _EsnyaButtonConfig {
  final double paddingBetween;

  final double borderRadius;

  final double iconSize;

  final Offset padding;

  final double height;
  final GetTextStyle getTextStyle;

  const _EsnyaButtonConfig({
    required this.paddingBetween,
    required this.borderRadius,
    required this.iconSize,
    required this.padding,
    required this.height,
    required this.getTextStyle,
  });
}

TextStyle _getTitleSmall(TextTheme t) {
  return t.titleSmall!;
}

TextStyle _getTitleLarge(TextTheme t) {
  return t.titleLarge!;
}

TextStyle _getHeadlineSmall(TextTheme t) {
  return t.headlineSmall!;
}

const _buttonConfigSmall = _EsnyaButtonConfig(
  paddingBetween: 4.0,
  borderRadius: 6.0,
  iconSize: 12.0,
  padding: Offset(8, 3),
  height: 16,
  getTextStyle: _getTitleSmall,
);

const _buttonConfigMedium = _EsnyaButtonConfig(
  paddingBetween: 4.0,
  borderRadius: 8.0,
  iconSize: 16.0,
  padding: Offset(8, 4),
  height: 24,
  getTextStyle: _getTitleLarge,
);

const _buttonConfigLarge = _EsnyaButtonConfig(
  paddingBetween: 8.0,
  borderRadius: 8.0,
  iconSize: 20,
  padding: Offset(16, 4),
  height: 32,
  getTextStyle: _getHeadlineSmall,
);

_EsnyaButtonConfig buttonSizeToConfig(ButtonSize buttonSize) {
  switch (buttonSize) {
    case ButtonSize.small:
      return _buttonConfigSmall;
    case ButtonSize.medium:
      return _buttonConfigMedium;
    case ButtonSize.large:
      return _buttonConfigLarge;
    default:
      return _buttonConfigMedium;
  }
}

class EsynaButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool disabled;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String title;
  GetColor getColor;
  GetColor getTextColor;
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
    final configValues = buttonSizeToConfig(buttonSize);

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (leadingIcon != null)
          Padding(
              padding: EdgeInsets.only(right: configValues.paddingBetween),
              child: Icon(
                leadingIcon,
                size: configValues.iconSize,
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
              padding: EdgeInsets.only(left: configValues.paddingBetween),
              child: Icon(
                trailingIcon,
                size: configValues.iconSize,
                color: tC,
              )),
      ],
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(configValues.borderRadius),
      side: BorderSide.none,
    );

    return Shadow(
      MaterialButton(
        color: c,
        disabledColor:
            Color.lerp(c, const Color.fromARGB(255, 184, 184, 184), 0.5),
        padding: EdgeInsets.symmetric(
          vertical: configValues.padding.dy,
          horizontal: configValues.padding.dx,
        ),
        minWidth: 0,
        height: configValues.height,
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
      radius: configValues.borderRadius,
    );
  }
}
