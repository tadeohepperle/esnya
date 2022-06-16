import 'package:dartz/dartz.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya/presentation/core/design_components/utils/grid_overlay.dart';
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
        backgroundColor: getColorScheme(context).surface,
        body: GridOverlay(
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ...([ButtonSize.small, ButtonSize.medium, ButtonSize.large]
                    .map((size) => [
                          EsnyaText.h3("Size: ${size.name}"),
                          Row(
                            children: [
                              EsynaButton.primary(
                                title: "Primary",
                                onPressed: () {},
                                buttonSize: size,
                              ),
                              EsynaButton.primary(
                                title: "Disabl",
                                buttonSize: size,
                              ),
                              EsynaButton.primary(
                                title: "Icon",
                                trailingIcon: Icons.wifi,
                                onPressed: () {},
                                buttonSize: size,
                              )
                            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
                          ),
                          Divider(),
                          Row(
                            children: [
                              EsynaButton.secondary(
                                title: "Secondary",
                                onPressed: () {},
                                buttonSize: size,
                              ),
                              EsynaButton.secondary(
                                title: "Disabl",
                                buttonSize: size,
                              ),
                              EsynaButton.secondary(
                                title: "Icon",
                                leadingIcon: Icons.wifi,
                                onPressed: () {},
                                buttonSize: size,
                              )
                            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
                          ),
                          Divider(),
                          Row(
                            children: [
                              EsynaButton.surface(
                                title: "Surface",
                                onPressed: () {},
                                buttonSize: size,
                              ),
                              EsynaButton.surface(
                                title: "Disabl",
                                buttonSize: size,
                              ),
                              EsynaButton.surface(
                                title: "Icon",
                                leadingIcon: Icons.wifi,
                                onPressed: () {},
                                buttonSize: size,
                              )
                            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
                          ),
                          Divider(
                            height: 30,
                          ),
                        ])
                    .expand(id)),
                EsnyaText.body("Esnya Icon Buttons:"),
                ...([
                  ButtonSize.small,
                  ButtonSize.medium,
                  ButtonSize.large,
                  ButtonSize.xxl
                ].map(
                  (size) => Container(
                    color: getColorScheme(context).surface,
                    width: double.infinity,
                    child: EsnyaSizes.paddingWrap(
                      Row(
                        children: [
                          EsnyaText.h3("Size: ${size.name}"),
                          EsnyaIconButton.primary(
                            Icons.ac_unit_sharp,
                            onPressed: () {},
                            buttonSize: size,
                          ),
                          EsnyaIconButton.secondary(
                            Icons.wifi,
                            onPressed: () {},
                            buttonSize: size,
                          ),
                          EsnyaIconButton.surface(
                            Icons.wifi,
                            onPressed: () {},
                            buttonSize: size,
                          ),
                        ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
