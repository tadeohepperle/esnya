import 'package:esnya/application/food_data/input/models/food_item_entry_wrapper.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';

import 'subpages/buttons_screen.dart';
import 'subpages/colors_screen.dart';
import 'subpages/dashboard_header_screen.dart';
import 'subpages/switches_screen.dart';
import 'subpages/food_input_bar_screen.dart';
import 'subpages/food_item_entry_card_screen.dart';
import 'subpages/food_item_entry_list_tile_screen.dart';
import 'subpages/text_styles_screen.dart';
import 'subpages/voice_input_sheet_screen.dart';

/// flutter run -t ./ui_design_example/main.dart

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
          body: GridOverlay(ExampleHomeScreen()),
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
            EsynaButton.primary(
              title: "assdsdasda",
              onPressed: () {
                print("ashdsjhsdja");
              },
            ),
            SubscreenListTile("Text Styles", (c) => TextStylesScreen()),
            SubscreenListTile("Color Styles", (c) => ColorsScreen()),
            SubscreenListTile("Buttons", (c) => ButtonsScreen()),
            SubscreenListTile("Switches", (c) => SwitchesScreen()),
            SubscreenListTile(
                "DashboardHeader", (c) => DashboardHeaderScreen()),
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

extension TestObjectsX on TestObjects {
  static FoodItemEntryFailed get foodItemEntryFailed => FoodItemEntryFailed(
        amount: Amount(MeasureUnit.g, 330),
        dateTime: DateTime.now(),
        uniqueId: UniqueId(),
        inputFoodName: "green peppers",
      );
  static FoodItemEntryProcessing get foodItemEntryProcessing =>
      FoodItemEntryProcessing(
        amount: Amount(MeasureUnit.oz, 12),
        dateTime: DateTime.now(),
        uniqueId: UniqueId(),
        inputFoodName: "green peppers",
      );
}
