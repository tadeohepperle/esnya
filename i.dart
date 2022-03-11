import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine_en.dart';

void main() async {
  FragmentizingEngine engine = FragmentizingEngineEN();
  var either = await engine.fragmentize("one gram of sugar two bananas");

  either.fold((err) {
    print("ERROR");
    print(err);
  }, (result) {
    for (var r in result) {
      print(r);
      print("-----");
    }
  });
}
