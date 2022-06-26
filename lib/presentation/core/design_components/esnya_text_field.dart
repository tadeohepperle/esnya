import 'package:esnya/presentation/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EsnyaTextField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelText;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  const EsnyaTextField(
      {Key? key,
      this.inputFormatters,
      this.keyboardType,
      this.labelText,
      this.onChanged,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = getColorScheme(context);
    final textTheme = getTextTheme(context);
    final border = OutlineInputBorder(
      borderRadius: EsnyaSizes.borderRadius,
      borderSide: BorderSide(color: Colors.transparent),
    );
    return Shadow(
      Container(
        height: 48,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: EsnyaSizes.borderRadius,
        ),
        child: TextField(
          controller: controller,
          style: textTheme.headlineSmall,
          decoration: InputDecoration(
            fillColor: colorScheme.surface,
            filled: true,
            labelText: labelText,
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            border: OutlineInputBorder(
                borderRadius: EsnyaSizes.borderRadius,
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: EsnyaSizes.borderRadius,
                borderSide: BorderSide(color: Colors.transparent)),
          ),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
