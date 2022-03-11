import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/data_structures.dart';
import 'package:esnya/domain/food_data/entities/food_item.dart';
import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:esnya/domain/food_data/food_analysis_repository.dart';
import 'package:esnya/domain/food_data/food_data_repository.dart';
import 'package:esnya/domain/food_data/text_processing/text_processing_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'foodinput_event.dart';
part 'foodinput_state.dart';
part 'foodinput_bloc.freezed.dart';

class FoodinputBloc extends Bloc<FoodinputEvent, FoodinputState> {
  TextProcessingRepository textProcessingRepository;
  FoodDataRepository foodDataRepository;
  FoodAnalysisRepository foodAnalysisRepository;

  BuildFoodItemStrings? buildFoodItemStringsCache;
  bool buildFoodItemStringsBusy = false;

  /// Flow of this Bloc:
  /// setVolatileText  -->  buildFoodItemStrings -->  applyFoodItemStrings
  /// fooditems only remain in the inputbloc as long as they are volatile. safeFoodItems
  FoodinputBloc({
    required this.textProcessingRepository,
    required this.foodDataRepository,
    required this.foodAnalysisRepository,
  }) : super(FoodinputState.initial()) {
    on<FoodinputEvent>((event, emit) async {
      await event.map(
          reset: (Reset e) {
            emit(FoodinputState.initial());
          },
          setVolatileText: (SetVolatileText e) {
            if (e.text != state.volatileText) {
              emit(state.copyWith(volatileText: e.text));
              add(const BuildFoodItemStrings());
            }
          },
          makeVolatileTextSafe: (MakeVolatileTextSafe e) {
            emit(state.copyWith(
                safeTextOpen: state.safeTextOpen + state.volatileText,
                volatileText: '',
                safeFoodItems: state.safeFoodItems + state.volatileFoodItems,
                volatileFoodItems: const KtList<FoodItem>.empty()));
          },
          buildFoodItemStrings: buildFoodItemStrings,
          applyFoodItemStrings: (ApplyFoodItemStrings e) {
            applyFoodItemStrings(e, emit);
          },
          fetchAmountAndFood: (FetchAmountAndFood e) async {
            await fetchAmountAndFood(e, emit);
          });
    });
  }

  Future<void> buildFoodItemStrings(BuildFoodItemStrings e) async {
    // check cache:
    if (buildFoodItemStringsBusy) {
      buildFoodItemStringsCache = e;
      return;
    }
    buildFoodItemStringsBusy = true;
    // execution:
    final text = state.safeTextOpen + ' ' + state.volatileText;
    final result = await textProcessingRepository.fragmentize(text);
    result.fold(
      (l) {
        // TODO: handle error somehow, but should actually be ignored. Maybe just logged.
      },
      (r) {
        add(ApplyFoodItemStrings(r.toImmutableList()));
      },
    );
    // handle potential next element in cache:
    buildFoodItemStringsBusy = false;
    if (buildFoodItemStringsCache != null) {
      BuildFoodItemStrings next = buildFoodItemStringsCache!;
      buildFoodItemStringsCache = null;
      add(next);
    }
  }

  applyFoodItemStrings(ApplyFoodItemStrings e, Emitter<FoodinputState> emit) {
    List<FoodItemString> safeFoodItemStrings = [];
    List<FoodItemString> volatileFoodItemStrings = [];

    int lastItemInSafeTextRangeEnd = 0;
    final matchText = state.safeTextOpen + " " + state.volatileText;

    for (var i = 0; i < e.items.size; i++) {
      final r = e.items[i].value1;
      final foodItemString = e.items[i].value2;
      assert(r.end >= lastItemInSafeTextRangeEnd);
      assert(r.start >= 0);
      // check if still matches with actual safeTextOpen + " " + volatileText of state:
      if (r.end > matchText.length) {
        break;
      }
      final isMatching =
          matchText.substring(r.start, r.end) == foodItemString.text;
      if (isMatching) {
        final isInSafeText = r.end <= state.safeTextOpen.length;
        if (isInSafeText) {
          lastItemInSafeTextRangeEnd = r.end;
          safeFoodItemStrings.add(foodItemString);
        } else {
          volatileFoodItemStrings.add(foodItemString);
        }
      } else {
        break;
      }
    }

    final newSafeTextClosed = state.safeTextClosed +
        state.safeTextOpen.substring(0, lastItemInSafeTextRangeEnd);
    final newSafeTextOpen = state.safeTextOpen
        .substring(lastItemInSafeTextRangeEnd, state.safeTextOpen.length);
    final newSafeFoodItems = state.safeFoodItems +
        safeFoodItemStrings
            .map((e) => FoodItem.create(e))
            .toImmutableList(); // without fetching any data yet
    final volatileFoodItems = volatileFoodItemStrings
        .map((e) => FoodItem.create(e))
        .toImmutableList();

    emit(state.copyWith(
      safeTextClosed: newSafeTextClosed,
      safeTextOpen: newSafeTextOpen,
      safeFoodItems: newSafeFoodItems,
      volatileFoodItems: volatileFoodItems,
    ));
  }

  fetchAmountAndFood(FetchAmountAndFood e, Emitter<FoodinputState> emit) async {
    // when result is fetched:
    //      foodItem is in safeFoodItems ==> remove foodItem and add it to open collection of foodDataRepository such that it is synced with firestore
    //      foodItem is volatileFoodItems ==> update it in volatileFoodItems, not move to firestore yet.
    //  	  foodItem does not exist anymore ==> nothing happens

    final foodItem = e.foodItem;
    final result =
        await foodAnalysisRepository.fetchAmountAndFood(foodItem.string);

    bool foodItemInsafeFoodItems =
        state.safeFoodItems.any((fi) => fi.uniqueId == foodItem.uniqueId);
    if (foodItemInsafeFoodItems) {
      await foodDataRepository.addItem(foodItem.copyWith(value: some(result)));
      final newSafeFoodItems =
          state.safeFoodItems.filter((fi) => fi.uniqueId != foodItem.uniqueId);
      emit(state.copyWith(safeFoodItems: newSafeFoodItems));
    } else {
      final newVolatileFoodItems = state.volatileFoodItems.map((fi) =>
          fi.uniqueId == foodItem.uniqueId
              ? fi.copyWith(value: some(result))
              : fi);
      emit(state.copyWith(volatileFoodItems: newVolatileFoodItems));
    }
  }
}
