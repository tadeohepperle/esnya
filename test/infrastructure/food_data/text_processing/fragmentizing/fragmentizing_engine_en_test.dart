import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine_en.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FragmentizingEngine engine = FragmentizingEngineEN();

  final exampleTexts = {
    '200 grams of flour': '200.0_g_flour',
    'three hundred fifty-three milliliters milk': '353.0_ml_milk',
    'twenty five donuts': '25.0_donuts',
    'half a cup of coffee': '0.5_cup_coffee',
    """
270 g 	flour
½ tsp 	baking soda
½ teaspoon 	salt
170 g 	butter (melted)
200 g 	raw sugar
100 g 	sugar
1 tbsp 	vanilla extract
1 	egg
350 g 	chocolate chips
cinnamon
""": """270.0_g_flour
0.5_tsp_baking soda
0.5_tsp_salt
170.0_g_butter (melted)
200.0_g_raw sugar
100.0_g_sugar
1.0_tbsp_vanilla extract
1.0_egg
350.0_g_chocolate chips
1.0_cinnamon"""
  };

// ,
//     "asdaasd sasaassSAd as s d s sds",
//     "123 kilo fLour",
//     "one 123 400 flowers"
//   ];

  group('test conversion result short strings', () {
    for (var testText in exampleTexts.keys) {
      test(
        'should convert testText correctly to FoodItemString list',
        () async {
          // act
          var result = await engine.fragmentize(testText);
          // assert
          result.fold((l) {
            expect(l, null);
          }, (r) {
            List<String> shortStringList = [];
            for (var tuple in r) {
              var foodItem = tuple.value2;
              shortStringList.add(foodItem.shortString());
            }
            String resultString = shortStringList.join("\n");
            expect(resultString, exampleTexts[testText]);
          });
        },
      );
    }
  });

  group(
      'substring from original from returned range and foodItem.text should be the same',
      () {
    for (var text in exampleTexts.keys) {
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
