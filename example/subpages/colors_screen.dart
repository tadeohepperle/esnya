import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:flutter/material.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  Widget _colorTile(String title, Color color, [Color? textColor]) {
    return Container(
      child: Center(
          child: EsnyaText.h3(
        title,
        color: textColor,
      )),
      height: 100,
      width: 100,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = getColorScheme(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 79, 79, 79),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              _colorTile("background", colorTheme.background),
              _colorTile("surface", colorTheme.surface),
              _colorTile("surface weak text", colorTheme.surface,
                  esnyaColorsLight.textSecondary),
              _colorTile("surface weakest text", colorTheme.surface,
                  esnyaColorsLight.textTertiary),
              _colorTile("primary", colorTheme.primary, colorTheme.surface),
              _colorTile("secondary", colorTheme.secondary, colorTheme.surface),
              _colorTile("error", colorTheme.error, colorTheme.surface),
              _colorTile(
                  "bg on surf", colorTheme.surface, colorTheme.background),
            ],
          ),
        ));
  }
}
