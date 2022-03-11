import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine_en.dart';

void main() async {
  FragmentizingEngine engine = FragmentizingEngineEN();
  var original = "4 EL Panko oder Semmelbrösel, 2 Olivenöl zum Anbraten";

  var either = await engine.fragmentize(original);

  either.fold((err) {
    print("ERROR");
    print(err);
  }, (result) {
    for (var r in result) {
      var rangeFromOriginal = r.value1;
      var foodItem = r.value2;
      print(foodItem);
      print(foodItem.shortString());

      // print(r);
      // print("-----");
    }
  });
}
