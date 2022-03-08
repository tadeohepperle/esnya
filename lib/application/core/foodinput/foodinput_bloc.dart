import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/core/data_structures.dart';
import 'package:esnya/domain/food_data/entities/food_item.dart';
import 'package:esnya/domain/food_data/entities/food_item_string.dart';
import 'package:esnya/domain/food_data/food_data_repository.dart';
import 'package:esnya/domain/text_processing/text_processing_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'foodinput_event.dart';
part 'foodinput_state.dart';
part 'foodinput_bloc.freezed.dart';

class FoodinputBloc extends Bloc<FoodinputEvent, FoodinputState> {
  TextProcessingRepository textProcessingRepository;
  FoodDataRepository foodDataRepository;

  BuildFoodItemStrings? buildFoodItemStringsCache;
  bool buildFoodItemStringsBusy = false;

  /// Flow of this Bloc:
  /// setVolatileText  -->  buildFoodItemStrings -->  applyFoodItemStrings
  FoodinputBloc(
      {required this.textProcessingRepository,
      required this.foodDataRepository})
      : super(FoodinputState.initial()) {
    on<FoodinputEvent>((event, emit) async {
      await event.map(
          reset: (Reset e) {
            emit(FoodinputState.initial());
          },
          setVolatileText: (SetVolatileText e) {
            if (e.text != state.volatileText) {
              emit(state.copyWith(volatileText: e.text));
              add(BuildFoodItemStrings());
            }
          },
          makeVolatileTextSafe: (MakeVolatileTextSafe e) {
            if (state.volatileText.isNotEmpty) {
              emit(state.copyWith(
                safeTextOpen: state.safeTextOpen + state.volatileText,
                volatileText: '',
              ));
              add(BuildFoodItemStrings()); // TODO: this is slightly inefficient because we actually do not need to build the FoodItemStrings again. We just need to shift some volatileFoodItems to safeFoodItems, thats all.
            }
          },
          buildFoodItemStrings: buildFoodItemStrings,
          applyFoodItemStrings: (ApplyFoodItemStrings e) {
            applyFoodItemStrings(e, emit);
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
        add(ApplyFoodItemStrings(r));
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
            .map((e) => FoodItem.created(e))
            .toImmutableList(); // without fetching any data yet
    final volatileFoodItems = volatileFoodItemStrings
        .map((e) => FoodItem.created(e))
        .toImmutableList();

    emit(state.copyWith(
      safeTextClosed: newSafeTextClosed,
      safeTextOpen: newSafeTextOpen,
      safeFoodItems: newSafeFoodItems,
      volatileFoodItems: volatileFoodItems,
    ));
  }
}
