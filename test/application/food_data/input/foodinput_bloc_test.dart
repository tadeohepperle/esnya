import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/application/food_data/input/foodinput_bloc.dart';
import 'package:esnya/domain/core/data_structures.dart';
import 'package:esnya/domain/core/unique_id.dart';
import 'package:esnya/domain/food_data/entities/measure_unit.dart';
import 'package:esnya/domain/food_data/food_analysis_repository.dart';
import 'package:esnya/domain/food_data/food_data.dart';
import 'package:esnya/domain/food_data/food_data_repository.dart';
import 'package:esnya/domain/food_data/text_processing/text_processing_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';

class MockFoodDataRepository extends Mock implements FoodDataRepository {}

class MockFoodAnalysisRepository extends Mock
    implements FoodAnalysisRepository {}

class MockTextProcessingRepository extends Mock
    implements TextProcessingRepository {
  @override
  Future<FragmentizeResult> fragmentize(String text) {
    final wordArr = text.split(" ");
    final List<Tuple2<IntRange, FoodItemString>> l = [];
    // return Future.value(right(l.toImmutableList()));
    var c = 0;
    for (var i = 0; i < wordArr.length ~/ 3; i++) {
      final w = "${wordArr[i * 3]} ${wordArr[i * 3 + 1]} ${wordArr[i * 3 + 2]}";
      final fis = FoodItemString(
        w,
        numberRange: IntRange(0, wordArr[i * 3].length + 1),
        unitRange: IntRange(wordArr[i * 3].length + 1,
            wordArr[i * 3].length + 1 + wordArr[i * 3 + 1].length + 1),
        labelRange: IntRange(
            wordArr[i * 3].length + 1 + wordArr[i * 3 + 1].length + 1,
            wordArr[i * 3].length +
                1 +
                wordArr[i * 3 + 1].length +
                1 +
                wordArr[i * 3 + 2].length),
        numberGuess: 1,
        unitGuess: MeasureUnit.g,
      );
      final r = IntRange(c, c + w.length);
      c += w.length + 1;
      l.add(Tuple2(r, fis));
    }
    return Future.value(right(l.toImmutableList()));
  }
}

void main() {
  FoodAnalysisRepository foodAnalysisRepository = MockFoodAnalysisRepository();
  FoodDataRepository foodDataRepository = MockFoodDataRepository();
  TextProcessingRepository textProcessingRepository =
      MockTextProcessingRepository();

  setUp(() {
    textProcessingRepository = MockTextProcessingRepository();
    foodDataRepository = MockFoodDataRepository();
  });

  test(
    'MockTextProcessingRepository should work',
    () async {
      // arrange

      // act
      var res = await textProcessingRepository
          .fragmentize("1 cup flower three big eggs and");
      // assert
      print(res);
    },
  );

  UniqueId uid = UniqueId();
  blocTest<FoodinputBloc, FoodinputState>(
    'test SetVolatileText',
    build: () => FoodinputBloc(
        foodDataRepository: foodDataRepository,
        textProcessingRepository: textProcessingRepository,
        foodAnalysisRepository: foodAnalysisRepository),
    act: (bloc) async {
      bloc.add(SetVolatileText('Hello'));
      bloc.add(SetVolatileText('You'));
      bloc.add(MakeVolatileTextSafe());
      bloc.add(SetVolatileText(' are awesome'));
      bloc.add(MakeVolatileTextSafe());
      await Future.delayed(Duration(milliseconds: 50));
      uid = bloc.state.safeFoodItems[0].uniqueId; // bypass randomness
    },
    expect: () => [
      FoodinputState.initial().copyWith(volatileText: 'Hello'),
      FoodinputState.initial().copyWith(volatileText: 'You'),
      FoodinputState.initial().copyWith(safeTextOpen: 'You', volatileText: ''),
      FoodinputState.initial()
          .copyWith(safeTextOpen: 'You', volatileText: ' are awesome'),
      FoodinputState.initial()
          .copyWith(safeTextOpen: 'You are awesome', volatileText: ''),
      FoodinputState.initial().copyWith(
          safeTextClosed: 'You are awesome',
          safeTextOpen: '',
          volatileText: '',
          safeFoodItems: [
            FoodItem(
                string: const FoodItemString(
                  "You are awesome",
                  numberRange: IntRange(0, 4),
                  unitRange: IntRange(4, 8),
                  labelRange: IntRange(8, 15),
                  numberGuess: 1,
                  unitGuess: MeasureUnit.g,
                ),
                value: none(),
                uniqueId: uid)
          ].toImmutableList()),
    ],
  );

  blocTest<FoodinputBloc, FoodinputState>(
    'test SetVolatileText does not trigger a state emit if no fooditem is added',
    build: () => FoodinputBloc(
        foodDataRepository: foodDataRepository,
        textProcessingRepository: textProcessingRepository,
        foodAnalysisRepository: foodAnalysisRepository),
    act: (bloc) {
      bloc.add(SetVolatileText('Hello'));
      bloc.add(MakeVolatileTextSafe());
    },
    expect: () => [
      FoodinputState.initial().copyWith(volatileText: 'Hello'),
      FoodinputState.initial().copyWith(safeTextOpen: 'Hello'),
    ],
  );

  blocTest<FoodinputBloc, FoodinputState>(
    'test Reset',
    build: () => FoodinputBloc(
        foodDataRepository: foodDataRepository,
        textProcessingRepository: textProcessingRepository,
        foodAnalysisRepository: foodAnalysisRepository),
    act: (bloc) {
      bloc.add(SetVolatileText('Hello'));
      bloc.add(MakeVolatileTextSafe());
      bloc.add(SetVolatileText('You'));
      bloc.add(Reset());
    },
    expect: () => [
      FoodinputState.initial().copyWith(volatileText: 'Hello'),
      FoodinputState.initial()
          .copyWith(safeTextOpen: 'Hello', volatileText: ''),
      FoodinputState.initial()
          .copyWith(safeTextOpen: 'Hello', volatileText: 'You'),
      FoodinputState.initial()
    ],
  );

  blocTest<FoodinputBloc, FoodinputState>(
    'test BuildFoodItemStrings does not do anything when added and there can no more fooditem be created',
    build: () => FoodinputBloc(
        foodDataRepository: foodDataRepository,
        textProcessingRepository: textProcessingRepository,
        foodAnalysisRepository: foodAnalysisRepository),
    act: (bloc) {
      bloc.add(SetVolatileText('Hello'));
      bloc.add(MakeVolatileTextSafe());
      bloc.add(SetVolatileText('You'));
      bloc.add(BuildFoodItemStrings());
      bloc.add(BuildFoodItemStrings());
      bloc.add(BuildFoodItemStrings());
    },
    expect: () => [
      FoodinputState.initial().copyWith(volatileText: 'Hello'),
      FoodinputState.initial()
          .copyWith(safeTextOpen: 'Hello', volatileText: ''),
      FoodinputState.initial()
          .copyWith(safeTextOpen: 'Hello', volatileText: 'You'),
    ],
  );
}
