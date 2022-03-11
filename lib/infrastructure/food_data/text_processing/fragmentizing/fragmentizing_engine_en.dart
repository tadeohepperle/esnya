import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/data_structures.dart';
import 'package:esnya/domain/core/failures.dart';
import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:esnya/domain/food_data/entities/measure_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'fragmentizing_engine.dart';

part 'fragmentizing_engine_en.freezed.dart';

class FragmentizingEngineEN implements FragmentizingEngine {
  static const Map<String, double> numbersDigit = {
    'quarter': 0.25,
    'half': 0.5,
    '½': 0.5,
    '¼': 0.25,
    '¾': 0.75,
    // TODO: maybe a and an with value 1?  "an apple, two bananas, a can of beer"?????
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
  };

  static const Map<String, double> numbersTeen = {
    'ten': 10,
    'eleven': 11,
    'twelve': 12,
    'thirteen': 13,
    'fourteen': 14,
    'fifteen': 15,
    'sixteen': 16,
    'seventeen': 17,
    'eighteen': 18,
    'nineteen': 19
  };

  static const Map<String, double> numbersTy = {
    'twenty': 20,
    'thirty': 30,
    'fourty': 40,
    'fifty': 50,
    'sixty': 60,
    'seventy': 70,
    'eighty': 80,
    'ninety': 90
  };

  static const Map<String, double> numbersBig = {
    'hundred': 100,
    'thousand': 1000,
    'million': 1000000,
  };

  static const units = {
    'gram': MeasureUnit.g,
    'grams': MeasureUnit.g,
    'g': MeasureUnit.g,
    'kilogram': MeasureUnit.kg,
    'kilo': MeasureUnit.kg,
    'kilos': MeasureUnit.kg,
    'kilograms': MeasureUnit.kg,
    'kg': MeasureUnit.kg,
    'ton': MeasureUnit.ton,
    'mg': MeasureUnit.mg,
    'milligram': MeasureUnit.mg,
    'oz': MeasureUnit.oz,
    'ounce': MeasureUnit.oz,
    'ounces': MeasureUnit.oz,
    'lbs': MeasureUnit.lbs,
    'pound': MeasureUnit.lbs,
    'pounds': MeasureUnit.lbs,
    'ml': MeasureUnit.ml,
    'milliliter': MeasureUnit.ml,
    'milliliters': MeasureUnit.ml,
    'l': MeasureUnit.l,
    'liter': MeasureUnit.l,
    'liters': MeasureUnit.l,
    'tsp': MeasureUnit.tsp,
    'teaspoon': MeasureUnit.tsp,
    'teaspoons': MeasureUnit.tsp,
    'tbsp': MeasureUnit.tbsp,
    'tablespoon': MeasureUnit.tbsp,
    'tablespoons': MeasureUnit.tbsp,
    'cup': MeasureUnit.cup,
    'cups': MeasureUnit.cup,
    'gal': MeasureUnit.gallon,
    'gallon': MeasureUnit.gallon,
  };

  static const noises = {'of', 'and', 'a'};

  static const splitters = {
    // TODO: add more splitters, like "   " for example
    "\n",
    "\r",
  };

  @override
  Future<FragmentizeResult> fragmentize(String text) async {
    try {
      List<AnalysisToken> tokens = extractAnalysisTokens(text);
      List<AnalysisTokenCollection> tokenCollections =
          extractAnalysisTokenCollections(tokens);
      List<AnalysisTokenCollectionTriplet> triplets =
          extractTriplets(tokenCollections);
      final endResults = convertTripletsToFoodItems(triplets, text);
      return right(endResults);
    } catch (_) {
      return left(TextFragmentizeFailure.unexpected());
    }
  }

  List<AnalysisToken> extractAnalysisTokens(String text) {
    var tokens = FragmentizingEngine.tokenize(text);
    tokens = FragmentizingEngine.grantSpecialStringsSeparateTokes(
        tokens, {...numbersBig.keys, ...numbersTy.keys, ...splitters});

    // filter out noise, that is elements of noises array or tokens that are too short:
    tokens = [
      for (var t in tokens)
        if (!(noises.contains(t.flatText) || t.flatText.isEmpty)) t
    ];
    // tag tokens:
    List<AnalysisToken> aTokens = tokens.map((t) {
      var tag = tagFromText(t.flatText);
      return AnalysisToken(token: t, tag: tag, category: categoryFromTag(tag));
    }).toList();
    return aTokens;
  }

  List<AnalysisTokenCollection> extractAnalysisTokenCollections(
      List<AnalysisToken> tokens) {
    List<AnalysisTokenCollection> tokenCollections = [];
    for (AnalysisToken t in tokens) {
      if (tokenCollections.isEmpty ||
          tokenCollections.last.category != t.category) {
        tokenCollections.add(AnalysisTokenCollection.fromAnalysisToken(t));
      } else {
        tokenCollections.last.add(t);
      }
    }

    return tokenCollections
        .where((col) => col.category != TokenCategory.splitter)
        .toList();
  }

  List<AnalysisTokenCollectionTriplet> extractTriplets(
      List<AnalysisTokenCollection> tokenCollections) {
    List<AnalysisTokenCollectionTriplet> triplets = [];

    AnalysisTokenCollectionNumber? number;
    AnalysisTokenCollectionUnit? unit;

    for (var col in tokenCollections) {
      if (col is AnalysisTokenCollectionNumber) {
        number = col;
        unit = null;
      } else {
        if (col is AnalysisTokenCollectionUnit) {
          unit = col;
        } else if (col is AnalysisTokenCollectionUnknown) {
          triplets.add(AnalysisTokenCollectionTriplet(
              label: col, number: number, unit: unit));
          number = unit = null;
        }
      }
    }
    return triplets;
  }

  List<Tuple2<IntRange, FoodItemString>> convertTripletsToFoodItems(
      List<AnalysisTokenCollectionTriplet> triplets, String originText) {
    List<Tuple2<IntRange, FoodItemString>> results = [];
    for (var triplet in triplets) {
      try {
        double numberGuess = triplet.number?.guess() ??
            AnalysisTokenCollectionNumber.defaultGuess;
        MeasureUnit unitGuess =
            triplet.unit?.guess() ?? AnalysisTokenCollectionUnit.defaultGuess;

        var tripletRange = triplet.range;
        var foodItemText =
            originText.substring(tripletRange.start, tripletRange.end);
        FoodItemString foodItemString = FoodItemString(
          foodItemText,
          labelRange: triplet.label.range - tripletRange.start,
          numberRange: triplet.number != null
              ? triplet.number!.range - tripletRange.start
              : null,
          unitRange: triplet.unit != null
              ? triplet.unit!.range - tripletRange.start
              : null,
          unitGuess: unitGuess,
          numberGuess: numberGuess,
        );
        results.add(Tuple2(tripletRange, foodItemString));
      } catch (ex) {
        // TODO: skip this foodItem???
        print(ex);
      }
    }
    return results;
  }

  TokenTag tagFromText(String text) {
    if (splitters.contains(text)) return TokenTag.splitter;
    if (units.keys.contains(text)) return TokenTag.unit;
    if (numbersDigit.keys.contains(text)) return TokenTag.numberDigit;
    if (numbersTeen.keys.contains(text)) return TokenTag.numberTeen;
    if (numbersTy.keys.contains(text)) return TokenTag.numberTy;
    if (numbersBig.keys.contains(text)) return TokenTag.numberBig;
    double? parsed = double.tryParse(text);
    if (parsed != null) return TokenTag.numberDirectlyParsable;

    return TokenTag.unknown;
  }

  TokenCategory categoryFromTag(TokenTag tag) {
    return tokenTagCategories[tag] ?? TokenCategory.unknown;
  }

  static const tokenTagCategories = {
    TokenTag.numberDirectlyParsable: TokenCategory.number,
    TokenTag.numberDigit: TokenCategory.number,
    TokenTag.numberTeen: TokenCategory.number,
    TokenTag.numberTy: TokenCategory.number,
    TokenTag.numberBig: TokenCategory.number,
    TokenTag.unit: TokenCategory.unit,
    TokenTag.noise: TokenCategory.unknown,
    TokenTag.unknown: TokenCategory.unknown,
    TokenTag.splitter: TokenCategory.splitter,
  };

  @override
  Future<num> numberStringToText(String numberString) {
    // TODO: implement numberStringToText
    throw UnimplementedError();
  }
}

@freezed
class AnalysisToken with _$AnalysisToken {
  const factory AnalysisToken(
      {required Token token,
      required TokenTag tag,
      required TokenCategory category}) = _AnalysisToken;
}

extension AnalysisTokenX on AnalysisToken {
  String get flatText => token.flatText;
  double? getNumericValue() {
    switch (tag) {
      case TokenTag.numberDirectlyParsable:
        return double.tryParse(token.flatText);
      case TokenTag.numberDigit:
        return FragmentizingEngineEN.numbersDigit[token.flatText];
      case TokenTag.numberTeen:
        return FragmentizingEngineEN.numbersTeen[token.flatText];
      case TokenTag.numberTy:
        return FragmentizingEngineEN.numbersTy[token.flatText];
      case TokenTag.numberBig:
        return FragmentizingEngineEN.numbersBig[token.flatText];
      default:
        return null;
    }
  }
}

class AnalysisTokenCollection {
  final List<AnalysisToken> tokens = [];
  add(AnalysisToken token) {
    tokens.add(token);
  }

  final TokenCategory category;
  AnalysisTokenCollection(this.category);

  IntRange get range =>
      IntRange(tokens.first.token.range.start, tokens.last.token.range.end);

  String get flatText => tokens.map((t) => t.flatText).join(" ");

  static AnalysisTokenCollection fromAnalysisToken(AnalysisToken token) {
    if (token.category == TokenCategory.number) {
      return AnalysisTokenCollectionNumber()..add(token);
    }
    if (token.category == TokenCategory.unit) {
      return AnalysisTokenCollectionUnit()..add(token);
    }
    if (token.category == TokenCategory.splitter) {
      return AnalysisTokenCollection(TokenCategory.splitter);
    }
    return AnalysisTokenCollectionUnknown()..add(token);
  }
}

class AnalysisTokenCollectionNumber extends AnalysisTokenCollection {
  AnalysisTokenCollectionNumber() : super(TokenCategory.number);

  static const double defaultGuess = 1;
  double guess() {
    Map<AnalysisToken, double?> valueMap = {
      for (var t in tokens) t: t.getNumericValue()
    };
    List<num> numList = [];
    for (var t in tokens) {
      double value = valueMap[t] ?? -1;
      if (value == -1) continue;
      if (t.tag == TokenTag.numberBig) {
        // like 100, 1000, 1 mio
        if (numList.isEmpty) {
          numList.add(value);
        } else {
          // specialadjust adjusts for something like 8 hundert 50 tausend, wo sich tausend auf 850 bezieht und nicht nur auf 50.
          bool specialadjust = value >= 1000 &&
              numList.length >= 2 &&
              numList[numList.length - 2] < 1000;
          if (numList.last == 0) {
            numList.last = value;
            if (specialadjust) numList[numList.length - 2] *= value;
          } else {
            numList.last *= value;
            if (specialadjust) numList[numList.length - 2] *= value;
            numList.add(0);
          }
        }
      } else {
        // e.g. 20, 3, 10
        if (numList.isEmpty) {
          numList.add(value);
        } else {
          numList.last += value;
        }
      }
    }
    // add all up:
    double sum = 0;
    for (var x in numList) {
      sum += x;
    }
    return sum;
  }
}

class AnalysisTokenCollectionUnit extends AnalysisTokenCollection {
  AnalysisTokenCollectionUnit() : super(TokenCategory.unit);
  static const MeasureUnit defaultGuess = MeasureUnit.noUnit;
  MeasureUnit guess() {
    return FragmentizingEngineEN.units[flatText] ?? defaultGuess;
  }
}

class AnalysisTokenCollectionUnknown extends AnalysisTokenCollection {
  AnalysisTokenCollectionUnknown() : super(TokenCategory.unknown);
}

class AnalysisTokenCollectionTriplet {
  AnalysisTokenCollectionNumber? number;
  AnalysisTokenCollectionUnit? unit;
  AnalysisTokenCollectionUnknown label;
  AnalysisTokenCollectionTriplet({required this.label, this.number, this.unit});

  IntRange get range => IntRange(
      number?.range.start ?? unit?.range.start ?? label.range.start,
      label.range.end);
}

enum TokenTag {
  numberDirectlyParsable,
  numberDigit, // Five
  numberTeen, // Thirteen
  numberTy, // Fourty
  numberBig, // Thousand
  unit,
  // attribute, // TODO: add adjectives, for example cooked noodles vs dry noodles.
  noise, // e.g. "of", leave this out e.g. in "3 grams of fish", or "a" in half a cup of coffee  ==> half cup coffee
  unknown,
  splitter
}

enum TokenCategory {
  number, // "one hundred" or "123" or "half"
  unit, // e.g "g", "kg" or "lbs"
  unknown, // label/title of food item e.g. "cheese pizza"
  splitter
}


// TODO: "one and a half glasses of milk"
// TODO: "two komma 5", "2,5", "5.4"
