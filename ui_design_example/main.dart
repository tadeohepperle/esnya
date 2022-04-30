import 'package:esnya/injection.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya/presentation/core/design_components/esnya_theme.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter/material.dart';

import 'subpages/buttons_screen.dart';
import 'subpages/colors_screen.dart';
import 'subpages/dashboard_header_screen.dart';
import 'subpages/food_input_bar_screen.dart';
import 'subpages/food_item_entry_card_screen.dart';
import 'subpages/food_item_entry_list_tile_screen.dart';
import 'subpages/text_styles_screen.dart';
import 'subpages/voice_input_sheet_screen.dart';

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
        padding: const EdgeInsets.all(16),
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
            SubscreenListTile(
                "FoodInputBarScreen", (c) => FoodInputBarScreen()),
            SubscreenListTile(
                "FoodItemEntryCardScreen", (c) => FoodItemEntryCardScreen()),
            SubscreenListTile(
                "VoiceInputSheetScreen", (c) => VoiceInputSheetScreen()),
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
