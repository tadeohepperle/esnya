import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  press(BuildContext context) {
    return () {
      print("Button pressed");
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
                title: "Primary",
                onPressed: () {},
              ),
              EsynaButton.primary(title: "Diabled"),
              EsynaButton.primary(
                title: "Icon",
                trailingIcon: Icons.wifi,
                onPressed: () {},
              )
            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
          ),
          Divider(),
          Row(
            children: [
              EsynaButton.secondary(
                title: "Secondary",
                onPressed: () {},
              ),
              EsynaButton.secondary(title: "Diabled"),
              EsynaButton.secondary(
                title: "Icon",
                leadingIcon: Icons.wifi,
                onPressed: () {},
              )
            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
          ),
          Divider(),
          Row(
            children: [
              EsynaButton.surface(
                title: "Surface",
                onPressed: () {},
              ),
              EsynaButton.surface(title: "Diabled"),
              EsynaButton.surface(
                title: "Icon",
                leadingIcon: Icons.wifi,
                onPressed: () {},
              )
            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
          ),
          Divider(),
          Row(
            children: [
              EsynaButton.surface(
                title: "Background",
                onPressed: () {},
              ),
              EsynaButton.surface(title: "Diabled"),
              EsynaButton.surface(
                title: "Icon",
                leadingIcon: Icons.wifi,
                onPressed: () {},
              )
            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
          ),
          Divider(
            height: 30,
          ),
          EsnyaText.body("Esnya Floating Action Buttons:"),
          Container(
            color: getColorScheme(context).surface,
            width: double.infinity,
            child: EsnyaSizes.paddingWrap(Row(
              children: [
                EsnyaIconButton.primary(
                  Icons.ac_unit_sharp,
                  onPressed: () {},
                ),
                EsnyaIconButton.primary(
                  Icons.wifi,
                  onPressed: () {},
                ),
                EsnyaIconButton.surface(
                  Icons.mic,
                  onPressed: () {},
                ),
                EsnyaIconButton.surface(
                  Icons.pending_actions,
                  onPressed: () {},
                ),
              ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
            )),
          ),
          Divider(
            height: 30,
          ),
          EsnyaText.body("Esnya Icon Buttons:"),
          Container(
            color: getColorScheme(context).surface,
            width: double.infinity,
            child: EsnyaSizes.paddingWrap(
              Row(
                children: [
                  EsnyaIconButton.primary(
                    Icons.ac_unit_sharp,
                    onPressed: () {},
                  ),
                  EsnyaIconButton.secondary(
                    Icons.wifi,
                    onPressed: () {},
                  ),
                  EsnyaIconButton.surface(
                    Icons.wifi,
                    onPressed: () {},
                  ),
                  EsnyaIconButton.surface(
                    Icons.wifi,
                    onPressed: () {},
                  ),
                ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
