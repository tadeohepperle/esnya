import 'dart:math';

import 'package:esnya/injection_environments.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya/presentation/core/design_components/esnya_theme.dart';
import 'package:esnya/presentation/core/snackbar/snackbar_util.dart';
import 'package:esnya/setup_services.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/// flutter run -t ./example/main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupEsnyaSharedResources();

  runApp(ExampleComponentsAppWidget());
}

class ExampleComponentsAppWidget extends StatelessWidget {
  const ExampleComponentsAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeDataLight,
        home: Scaffold(
          body: ExampleHomeScreen(),
        ));
  }
}

class ExampleHomeScreen extends StatelessWidget {
  const ExampleHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("All Components:"),
            Divider(
              height: 30,
            ),
            SubscreenListTile("Text Styles", (c) => TextStylesScreen()),
            SubscreenListTile("Color Styles", (c) => ColorsScreen()),
            SubscreenListTile("Buttons", (c) => ButtonsScreen())
          ],
        ),
      )),
    );
  }
}

class SubscreenListTile extends StatelessWidget {
  Widget Function(BuildContext) builder;
  final String title;
  SubscreenListTile(this.title, this.builder, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(children: [
        Expanded(child: Text(title)),
        Icon(Icons.arrow_right_alt_outlined)
      ]),
      onTap: () {
        showDialog(context: context, builder: builder);
      },
    );
  }
}

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
    final colorTheme = getColorTheme(context);
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

class TextStylesScreen extends StatelessWidget {
  const TextStylesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> texts = [
      EsnyaText.h1("h1 - Heading 1"),
      EsnyaText.h2("h2 - Heading 2"),
      EsnyaText.h3("h3 - Heading 3"),
      EsnyaText.title("title - e.g. Button 1"),
      EsnyaText.titleSmall("titleSmall - e.g. 134 kcal"),
      EsnyaText.body("body - e.g. This is a drink"),
      EsnyaText.bodySmall("bodySmall - e.g. 02:13"),
    ];

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: texts
            .map((e) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: e,
                ))
            .toList(),
      ),
    ));
  }
}

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  press(BuildContext context) {
    return () {
      showSnackBar(context, "Button pressed");
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            children: [
              EsynaButton.primary(
                  onPressed: press(context), title: "Primary Button"),
              EsynaButton.secondary(
                  onPressed: press(context), title: "Secondary Button")
            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
          ),
          Row(
            children: [
              EsynaButton.primary(title: "Primary Disabled"),
              EsynaButton.secondary(title: "Secondary Disabled")
            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
          ),
          Divider(),
          Center(
            child: EsynaButton.primary(
                onPressed: press(context), title: "Primary Button"),
          ),
          Divider(),
          Center(
            child: EsynaButton.secondary(
                onPressed: press(context), title: "Secondary Button"),
          ),
          Divider(),
          Center(
            child: EsynaButton.primary(
              onPressed: press(context),
              title: "Primary Icon",
              iconData: Icons.local_airport,
            ),
          ),
          Divider(),
          EsynaButton.secondary(
            onPressed: press(context),
            title: "Secondary Icon Wide",
            iconData: Icons.local_airport,
          ),
          Divider(),
        ],
      ),
    ));
  }
}
