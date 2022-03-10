import 'dart:collection';

import 'package:esnya/domain/core/data_structures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'fragmentizing_engine.freezed.dart';

abstract class FragmentizingEngine {
  Future<FragmentizeResult> fragmentize(String text);

  static String flattenText(String text) => text.toLowerCase();

  static List<Token> tokenize(String text) {
    var regex = RegExp(r"[^_ \.,!?]+");
    var matches = regex.allMatches(text);
    return [
      for (var m in matches)
        Token(
          IntRange(m.start, m.end),
          flattenText(text.substring(m.start, m.end)),
        )
    ];
  }

  static List<Token> grantSpecialStringsSeparateTokes(
      List<Token> tokens, Set<String> specialStrings) {
    List<Token> splitOnSpecialStrings(Token t, String special) {
      var matches = special.allMatches(t.flatText).toList();
      if (matches.isEmpty) return [t];
      SplayTreeSet<int> splitIndices = SplayTreeSet<int>();
      for (var m in matches) {
        splitIndices.add(m.start);
        splitIndices.add(m.end);
      }
      splitIndices.add(0);
      splitIndices.add(t.flatText.length);
      var splitIndicesList = splitIndices.toList();
      List<Token> results = [];
      for (var i = 0; i < splitIndicesList.length - 1; i++) {
        var start = splitIndicesList[i];
        var end = splitIndicesList[i + 1];
        results.add(Token(IntRange(t.range.start + start, t.range.start + end),
            t.flatText.substring(start, end)));
      }
      return results;
    }

    var results = tokens;
    for (var s in specialStrings) {
      results = [for (var t in results) ...splitOnSpecialStrings(t, s)];
    }
    return results;
  }
}

@freezed
abstract class Token with _$_Token {
  const factory Token(IntRange range, String flatText) = __Token;
}
