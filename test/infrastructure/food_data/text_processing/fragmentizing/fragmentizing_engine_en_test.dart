import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine_en.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FragmentizingEngine engine = FragmentizingEngineEN();

  final exampleTexts = [
    "one Gram of    Sugar  two Bananas",
    "asdaasd sasaassSAd as s d s sds",
    "123 kilo fLour",
    "one 123 400 flowers"
  ];

  group(
      'substring from original from returned range and foodItem.text should be the same',
      () {
    for (var text in exampleTexts) {
      test(
        'should ',
        () async {
          // act
          var result = await engine.fragmentize(text);
          // assert
          result.fold((l) {
            expect(l, null);
          }, (r) {
            for (var tuple in r) {
              var rangeFromOriginal = tuple.value1;
              var foodItem = tuple.value2;
              expect(
                  text.substring(
                      rangeFromOriginal.start, rangeFromOriginal.end),
                  foodItem.text);
            }
          });
        },
      );
    }
  });
}
