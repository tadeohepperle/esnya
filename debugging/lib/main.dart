import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine_en.dart';

void main() async {
  FragmentizingEngine engine = FragmentizingEngineEN();
  var original = """
  8	Tomate(n), (Strauchtomaten)
200 g	Feta-Käse
2 tbsp	Olivenöl
1 tbsp	Oregano, getrockneter
Salz und Pfeffer
Basilikum
Oregano
  
  """;

  var either = await engine.fragmentize(original);

  either.fold((err) {
    print("ERROR");
    print(err);
  }, (result) {
    for (var r in result) {
      var rangeFromOriginal = r.value1;
      var foodItem = r.value2;
      print("-----");
      print(foodItem);

      // print(r);
      // print("-----");
    }
  });
}
