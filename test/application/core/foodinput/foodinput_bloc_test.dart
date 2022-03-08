import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/application/core/foodinput/foodinput_bloc.dart';
import 'package:esnya/domain/core/data_structures.dart';
import 'package:esnya/domain/food_data/entities/food_item.dart';
import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:esnya/domain/food_data/food_data_repository.dart';
import 'package:esnya/domain/text_processing/text_processing_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';

class MockFoodDataRepository extends Mock implements FoodDataRepository {}

class MockTextProcessingRepository extends Mock
    implements TextProcessingRepository {
  @override
  FragmentizeResult fragmentize(String text) {
    final wordArr = text.split(" ");
    final List<Tuple2<IntRange, FoodItemString>> l = [];
    return Future.value(right(l.toImmutableList()));
    var c = 0;
    for (var i = 0; i < wordArr.length ~/ 3; i++) {
      final w = "${wordArr[i * 3]} ${wordArr[i * 3 + 1]} ${wordArr[i * 3 + 2]}";
      final fis = FoodItemString(w,
          number: IntRange(0, wordArr[i * 3].length + 1),
          unit: IntRange(
              wordArr[i * 3].length + 1, wordArr[i * 3 + 1].length + 1),
          label: IntRange(
              wordArr[i * 3 + 1].length + 1, wordArr[i * 3 + 2].length));
      final r = IntRange(c, c + w.length);
      c += w.length + 1;
      l.add(Tuple2(r, fis));
    }
    return Future.value(right(l.toImmutableList()));
  }
}

void main() {
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

  // test('test1', () {
  //   final bloc = FoodinputBloc(
  //       foodDataRepository: foodDataRepository,
  //       textProcessingRepository: textProcessingRepository);
  //   bloc.add(SetVolatileText("Hello"));
  //   expectLater(
  //       bloc.state,
  //       emitsInOrder([
  //         FoodinputState(
  //           safeTextClosed: '',
  //           safeTextOpen: '',
  //           volatileText: '',
  //           safeFoodItems: KtList.empty(),
  //           volatileFoodItems: KtList.empty(),
  //         )
  //       ]));
  // emitsInOrder([
  //   const FoodinputState(
  //     safeTextClosed: '',
  //     safeTextOpen: '',
  //     volatileText: 'Hello',
  //     safeFoodItems: KtList.empty(),
  //     volatileFoodItems: KtList.empty(),
  //   )
  // ]));
  // });

  blocTest<FoodinputBloc, FoodinputState>(
    'test SetVolatileText',
    build: () => FoodinputBloc(
        foodDataRepository: foodDataRepository,
        textProcessingRepository: textProcessingRepository),
    act: (bloc) {
      bloc.add(SetVolatileText('Hello'));
      bloc.add(SetVolatileText('You'));
      bloc.add(MakeVolatileTextSafe());
      bloc.add(SetVolatileText(' are awsome'));
      bloc.add(MakeVolatileTextSafe());
    },
    expect: () => [
      FoodinputState.initial().copyWith(volatileText: 'Hello'),
      FoodinputState.initial().copyWith(volatileText: 'You'),
      FoodinputState.initial().copyWith(safeTextOpen: 'You', volatileText: ''),
      FoodinputState.initial()
          .copyWith(safeTextOpen: 'You', volatileText: ' are awsome'),
      FoodinputState.initial()
          .copyWith(safeTextOpen: 'You are awsome', volatileText: '')
    ],
  );

  blocTest<FoodinputBloc, FoodinputState>(
    'test Reset',
    build: () => FoodinputBloc(
        foodDataRepository: foodDataRepository,
        textProcessingRepository: textProcessingRepository),
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

  // blocTest<FoodinputBloc, FoodinputState>(
  //   'test BuildFoodItemStrings',
  //   build: () => FoodinputBloc(
  //       foodDataRepository: foodDataRepository,
  //       textProcessingRepository: textProcessingRepository),
  //   act: (bloc) {
  //     bloc.add(SetVolatileText('Hello'));
  //     bloc.add(MakeVolatileTextSafe());
  //     bloc.add(SetVolatileText(' You'));
  //     bloc.add(BuildFoodItemStrings());
  //   },
  //   expect: () => [
  //     FoodinputState.initial().copyWith(volatileText: 'Hello'),
  //     FoodinputState.initial()
  //         .copyWith(safeTextOpen: 'Hello', volatileText: ''),
  //     FoodinputState.initial()
  //         .copyWith(safeTextOpen: 'Hello', volatileText: 'You'),
  //     FoodinputState.initial()
  //   ],
  // );
}
