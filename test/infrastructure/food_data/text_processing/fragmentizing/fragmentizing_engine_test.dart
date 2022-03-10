import 'package:esnya/domain/core/data_structures.dart';
import 'package:esnya/infrastructure/food_data/text_processing/fragmentizing/fragmentizing_engine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FragmentizingEngine.tokenize', () {
    test(
      'should fragmentize correctly',
      () async {
        // arrange
        var text = "Hey, 100 grams!";
        // act
        var fragments = FragmentizingEngine.tokenize(text);
        // assert
        expect(fragments, [
          Token(IntRange(0, 3), 'hey'),
          Token(IntRange(5, 8), '100'),
          Token(IntRange(9, 14), 'grams')
        ]);
      },
    );
  });
  group('FragmentizingEngine.grantSpecialStringsSeparateTokes', () {
    test(
      'should not split if no splits are necessary',
      () async {
        // arrange
        var text = "Hey, 100 grams!";
        // act
        var fragments = FragmentizingEngine.tokenize(text);
        fragments = FragmentizingEngine.grantSpecialStringsSeparateTokes(
            fragments, {'ice', 'one', 'great'});
        // assert
        expect(fragments, [
          Token(IntRange(0, 3), 'hey'),
          Token(IntRange(5, 8), '100'),
          Token(IntRange(9, 14), 'grams')
        ]);
      },
    );

    test(
      'should split if splits are necessary',
      () async {
        // arrange
        var text = "Hey, 100 grams!";
        // act
        var fragments = FragmentizingEngine.tokenize(text);
        fragments = FragmentizingEngine.grantSpecialStringsSeparateTokes(
            fragments, {'ice', 'one', 'great', 'gram'});
        // assert
        expect(fragments, [
          Token(IntRange(0, 3), 'hey'),
          Token(IntRange(5, 8), '100'),
          Token(IntRange(9, 13), 'gram'),
          Token(IntRange(13, 14), 's')
        ]);
      },
    );

    test(
      'should split if splits are necessary',
      () async {
        // arrange
        var text = "Pinkteddybear, go away";
        // act
        var fragments = FragmentizingEngine.tokenize(text);
        fragments = FragmentizingEngine.grantSpecialStringsSeparateTokes(
            fragments, {'ink', 'teddy', 'shiny'});
        // assert
        expect(fragments, [
          Token(IntRange(0, 1), 'p'),
          Token(IntRange(1, 4), 'ink'),
          Token(IntRange(4, 9), 'teddy'),
          Token(IntRange(9, 13), 'bear'),
          Token(IntRange(15, 17), 'go'),
          Token(IntRange(18, 22), 'away')
        ]);
      },
    );
  });
}
