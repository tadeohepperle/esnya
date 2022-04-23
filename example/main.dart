import 'package:dartz/dartz.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya/presentation/core/design_components/big_nutrient_goal_display.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya/presentation/core/design_components/esnya_theme.dart';
import 'package:esnya/presentation/core/design_components/food_item_entry_list_tile.dart';
import 'package:esnya_shared_resources/core/utils/test_objects.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

/// flutter run -t ./example/main.dart

void main() async {
  configureInjection(isolate1.name);
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
            SubscreenListTile("Buttons", (c) => ButtonsScreen()),
            SubscreenListTile(
                "DashboardHeaderScreen", (c) => DashboardHeaderScreen()),
            SubscreenListTile("Food Item Entry List Tiles",
                (c) => FoodItemEntryListTileScreen()),
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
                iconData: Icons.wifi,
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
                iconData: Icons.wifi,
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
                iconData: Icons.wifi,
                onPressed: () {},
              )
            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
          ),
          Divider(),
          Row(
            children: [
              EsynaButton.background(
                title: "Background",
                onPressed: () {},
              ),
              EsynaButton.background(title: "Diabled"),
              EsynaButton.background(
                title: "Icon",
                iconData: Icons.wifi,
                onPressed: () {},
              )
            ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
          ),
          Divider(
            height: 30,
          ),
          EsnyaText.body("Esnya Floating Action Buttons:"),
          shadowWrapLarge(Container(
            color: getColorScheme(context).surface,
            width: double.infinity,
            child: EsnyaSizes.paddingWrap(Row(
              children: [
                EsnyaIconButton.primary(
                  Icons.ac_unit_sharp,
                  onPressed: () {},
                  floatingActionStyle: true,
                ),
                EsnyaIconButton.primary(
                  Icons.wifi,
                  onPressed: () {},
                  floatingActionStyle: true,
                ),
                EsnyaIconButton.surface(
                  Icons.mic,
                  onPressed: () {},
                  floatingActionStyle: true,
                ),
                EsnyaIconButton.background(
                  Icons.pending_actions,
                  onPressed: () {},
                  floatingActionStyle: true,
                ),
              ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
            )),
          )),
          Divider(
            height: 30,
          ),
          EsnyaText.body("Esnya Icon Buttons:"),
          shadowWrapLarge(Container(
            color: getColorScheme(context).surface,
            width: double.infinity,
            child: EsnyaSizes.paddingWrap(Row(
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
                EsnyaIconButton.background(
                  Icons.wifi,
                  onPressed: () {},
                ),
              ].map((e) => EsnyaSizes.paddingWrap(e)).toList(),
            )),
          ))
        ],
      ),
    ));
  }
}

class DashboardHeaderScreen extends StatelessWidget {
  const DashboardHeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shadowWrapLarge(
        Container(
          padding: EdgeInsets.all(EsnyaSizes.base * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(EsnyaSizes.base * 3),
              bottomRight: const Radius.circular(EsnyaSizes.base * 3),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text("Hello Tadeo, this is your day in numbers"),
              // SizedBox(
              //   height: 24,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EsynaButton.custom(
                    title: "Today, 24 Mar, 2022",
                    iconData: Icons.calendar_today,
                    onPressed: () {},
                    shadowSize: ShadowSize.none,
                    customPadding:
                        EdgeInsets.only(top: 6, bottom: 6, right: 7, left: 7),
                    customPaddingBetweenIconAndText: 16,
                  ),
                  EsnyaIconButton.custom(
                    Icons.settings,
                    onPressed: () {},
                    shadowSize: ShadowSize.none,
                    customIconSize: 24,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BigNutrientGoalDisplay(
                getColor: (c) => c.secondary,
                iconData: Icons.invert_colors,
                largeText: '1235 kcal',
                smallText: '/ 2300 kcal',
              ),
              SizedBox(
                height: 8,
              ),
              BigNutrientGoalDisplay(
                iconData: Icons.icecream,
                largeText: '43 g',
                smallText: '/ 120 g Protein',
              ),
              Center(
                child: Transform.translate(
                  offset: Offset(0, 16),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: esnyaColorsLight.textTertiary,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FoodItemEntryListTileScreen extends StatelessWidget {
  FoodItemEntryListTileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = getColorScheme(context);

    List<Tuple2<FoodItemEntry, BadgeDisplayMode>> data = [
      Tuple2(TestObjects.foodItemEntrySuccess, BadgeDisplayMode.kcal),
      Tuple2(
          TestObjects.foodItemEntrySuccess.copyWith(
              foodItem: TestObjects.foodItemEntrySuccess.foodItem
                  .copyWith(amount: Amount(MeasureUnit.g, 234.34))),
          BadgeDisplayMode.protein),
      Tuple2(TestObjects.foodItemEntrySuccess, BadgeDisplayMode.kcal)
    ];

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                ...data
                    .map((e) => FoodItemEntryListTile(
                          foodItemEntry: e.value1,
                          badgeDisplayMode: e.value2,
                        ))
                    .map((e) => EsnyaSizes.paddingWrap(e))
              ],
            )));
  }
}
