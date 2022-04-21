import 'package:esnya/injection_environments.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya/presentation/core/design_components/esnya_theme.dart';
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
            SubscreenListTile("Color Styles", (c) => ColorsScreen())
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text("Colors Screen")));
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
      padding: const EdgeInsets.all(8.0),
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
