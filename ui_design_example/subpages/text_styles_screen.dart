import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:flutter/material.dart';

class TextStylesScreen extends StatelessWidget {
  const TextStylesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> texts = [
      EsnyaText.h1("h1 - Heading 1"),
      EsnyaText.h2("h2 - Heading 2"),
      EsnyaText.h3("h3 - Heading 3"),
      EsnyaText.titleBold("titleBold - e.g. Title 1"),
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
