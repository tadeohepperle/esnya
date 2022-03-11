import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine_en.dart';

void main() async {
  FragmentizingEngine engine = FragmentizingEngineEN();
  var original = "two hundred ten cups of salt";
  var either = await engine.fragmentize(original);

  either.fold((err) {
    print("ERROR");

    print(err);
  }, (result) {
    for (var r in result) {
      var rangeFromOriginal = r.value1;
      var foodItem = r.value2;

      print(foodItem.text);
      print(foodItem.text
          .substring(foodItem.labelRange.start, foodItem.labelRange.end));
      print(foodItem);

      // print(r);
      // print("-----");
    }
  });
}
