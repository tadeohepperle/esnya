import 'package:esnya/presentation/core/core.dart';
import 'package:flutter/material.dart';

String _stringify(dynamic e) {
  return e.toString();
}

class EsnyaDropdownButton<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) mapItemToDisplayedString;

  final void Function(T?)? onChanged;
  final T? value;
  const EsnyaDropdownButton({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.value,
    this.mapItemToDisplayedString = _stringify,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final textTheme = getTextTheme(context);
    return Shadow(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: colorScheme.surface, borderRadius: EsnyaSizes.borderRadius),
        height: 48,
        child: DropdownButton<T>(
          value: value,
          // icon: const Icon(Icons.arrow_drop_down),
          borderRadius: EsnyaSizes.borderRadius,
          // isDense: true,
          underline: SizedBox.shrink(),
          style: textTheme.headlineSmall,
          onChanged: onChanged,
          items: items
              .map((e) => DropdownMenuItem<T>(
                    value: e,
                    child: Text(mapItemToDisplayedString(e)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
