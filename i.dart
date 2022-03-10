import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine.dart';

main() {
  // var s = "lol";
  // String a = "Hallolol du Penn";
  // var matches = s.allMatches(a);
  // print([
  //   for (var m in matches) [m.start, m.end]
  // ]);
  var text = "Hey, 100 grams!";
  var o = FragmentizingEngine.tokenize(text);

  // var regex = RegExp(r"[^_ \.,!?]+");
  // var matches = regex.allMatches(text);
  // return [
  //   for (var m in matches)
  //     _Token(
  //       IntRange(m.start, m.end),
  //       _flattenText(text.substring(m.start, m.end)),
  //     )
  // ];
  print(o);
}
