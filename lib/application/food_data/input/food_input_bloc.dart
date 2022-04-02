import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:esnya_shared_resources/text_processing/models/food_item_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'food_input_event.dart';
part 'food_input_state.dart';
part 'food_input_bloc.freezed.dart';

@isolate1
@injectable
class FoodInputBloc extends Bloc<FoodInputEvent, FoodInputState> {
  TextProcessingRepository textProcessingRepository;
  FoodMappingRepository foodMappingRepository;

  FoodInputBloc({
    required this.textProcessingRepository,
    required this.foodMappingRepository,
  }) : super(FoodInputState.initial()) {
    on<FoodInputEvent>((event, emit) async {
      await event.map(
          reset: (Reset e) {
            emit(FoodInputState.initial());
          },
          setVolatileText: (SetVolatileText e) {
            if (e.text != state.volatileText) {
              emit(state.copyWith(volatileText: e.text));
              add(const BuildFragments());
            }
          },
          makeVolatileTextSafe: (MakeVolatileTextSafe e) {
            emit(state.copyWith(
              safeTextOpen: state.safeTextOpenAndVolatileText,
              volatileText: '',
            ));
            add(const BuildFragments());
          },
          buildFragments: buildFragments,
          applyFragments: (ApplyFragments event) {
            applyFragments(event, emit);
          },
          fetchFoodForFoodItemEntry: (FetchFoodForFoodItemEntry event) {
            // TODO:
          }
          // applyFoodItemStrings: (ApplyFoodItemStrings e) {
          //   applyFoodItemStrings(e, emit);
          // },
          // fetchAmountAndFood: (FetchAmountAndFood e) async {
          //   await fetchAmountAndFood(e, emit);
          // },
          );
    });
  }

  // the caching ensures that at any time only one buildFragments is running.
  // If during this time another BuildFragments event comes in, the cache
  // is overriden with it and it will be processed after the buildFragments() function is done.
  BuildFragments? buildFragmentsEventCache;
  bool buildFragmentsBusy = false;
  Future<void> buildFragments(BuildFragments e) async {
    // check cache:
    if (buildFragmentsBusy) {
      buildFragmentsEventCache = e;
      return;
    }
    buildFragmentsBusy = true;
    // execution:
    final text = state.safeTextOpenAndVolatileText; // TODO: space necessary?
    final result = await textProcessingRepository.fragmentize(text);
    add(ApplyFragments(result));
    // handle potential next element in cache:
    buildFragmentsBusy = false;
    if (buildFragmentsEventCache != null) {
      BuildFragments next = buildFragmentsEventCache!;
      buildFragmentsEventCache = null;
      add(next);
    }
  }

  applyFragments(ApplyFragments event, Emitter<FoodInputState> emit) {
    final fragmentizationResult = event.fragmentizationResult;
    int lastItemInSafeTextRangeEnd = 0;
    final matchText = state.safeTextOpenAndVolatileText;
    List<FoodItemString> safeFoodItemStrings = [];
    List<FoodItemString> volatileFoodItemStrings = [];

    for (var i = 0; i < fragmentizationResult.fragments.length; i++) {
      final frag = fragmentizationResult.fragments[i];
      final range = frag.value1;
      final foodItemString = frag.value2;
      assert(range.end >= lastItemInSafeTextRangeEnd);
      assert(range.start >= 0);

      if (range.end > matchText.length) {
        // can happen when inbetween a part from volatile text has been deleted:
        break;
      }
      final isMatching =
          matchText.substring(range.start, range.end) == foodItemString.text;
      if (!isMatching) {
        // can happen when volatiletext has changed since, so foodItemString is not relevant anymore.
        break;
      }
      final isInSafeText = range.end <= state.safeTextOpen.length;
      if (isInSafeText) {
        lastItemInSafeTextRangeEnd = range.end;
        safeFoodItemStrings.add(foodItemString);
      } else {
        volatileFoodItemStrings.add(foodItemString);
      }
    }
    print(lastItemInSafeTextRangeEnd);

    final newSafeTextClosed = state.safeTextClosed +
        state.safeTextOpen.substring(0, lastItemInSafeTextRangeEnd);
    final newSafeTextOpen = state.safeTextOpen
        .substring(lastItemInSafeTextRangeEnd, state.safeTextOpen.length);
    final newSafeFoodItemEntries = state.safeFoodItemEntries +
        safeFoodItemStrings
            .map(FoodItemEntry.fromFoodItemString)
            .toImmutableList();
    final newVolatileFoodItemEntries = volatileFoodItemStrings
        .map(FoodItemEntry.fromFoodItemString)
        .toImmutableList();
    if (newSafeFoodItemEntries.size > 0) {
      print("help");
    }
    final safeTextClosed = state.safeTextClosed;
    final safeTextOpen = state.safeTextOpen;
    final volatileText = state.volatileText;
    final safeFoodItemEntries = state.safeFoodItemEntries;
    final volatileFoodItemEntries = state.volatileFoodItemEntries;
    emit(state.copyWith(
      safeTextClosed: newSafeTextClosed,
      safeTextOpen: newSafeTextOpen,
      safeFoodItemEntries: newSafeFoodItemEntries,
      volatileFoodItemEntries: newVolatileFoodItemEntries,
    ));
  }

  // applyFoodItemStrings(ApplyFragments event, Emitter<FoodInputState> emit) {
  //   final fragmentizationResult = event.fragmentizationResult;

  //   for (var i = 0; i < fragmentizationResult.fragments.length; i++) {
  //     final frag = fragmentizationResult.fragments[i];
  //     final range = frag.value1;
  //     final foodItemString = frag.value2;
  //   }

  //   //// REDO

  //   List<FoodItemString> safeFoodItemStrings = [];
  //   List<FoodItemString> volatileFoodItemStrings = [];

  //   int lastItemInSafeTextRangeEnd = 0;
  //   final matchText = state.safeTextOpenAndVolatileText;

  //   for (var i = 0; i < e.items.size; i++) {
  //     final r = e.items[i].value1;
  //     final foodItemString = e.items[i].value2;
  //     assert(r.end >= lastItemInSafeTextRangeEnd);
  //     assert(r.start >= 0);
  //     // check if still matches with actual safeTextOpen + " " + volatileText of state:
  //     if (r.end > matchText.length) {
  //       break;
  //     }
  //     final isMatching =
  //         matchText.substring(r.start, r.end) == foodItemString.text;
  //     if (isMatching) {
  //       final isInSafeText = r.end <= state.safeTextOpen.length;
  //       if (isInSafeText) {
  //         lastItemInSafeTextRangeEnd = r.end;
  //         safeFoodItemStrings.add(foodItemString);
  //       } else {
  //         volatileFoodItemStrings.add(foodItemString);
  //       }
  //     } else {
  //       break;
  //     }
  //   }

  //   final newSafeTextClosed = state.safeTextClosed +
  //       state.safeTextOpen.substring(0, lastItemInSafeTextRangeEnd);
  //   final newSafeTextOpen = state.safeTextOpen
  //       .substring(lastItemInSafeTextRangeEnd, state.safeTextOpen.length);
  //   final newSafeFoodItems = state.safeFoodItems +
  //       safeFoodItemStrings
  //           .map((e) => FoodItem.create(e))
  //           .toImmutableList(); // without fetching any data yet
  //   final volatileFoodItems = volatileFoodItemStrings
  //       .map((e) => FoodItem.create(e))
  //       .toImmutableList();

  //   emit(state.copyWith(
  //     safeTextClosed: newSafeTextClosed,
  //     safeTextOpen: newSafeTextOpen,
  //     safeFoodItems: newSafeFoodItems,
  //     volatileFoodItems: volatileFoodItems,
  //   ));
  // }

  // fetchAmountAndFood(FetchAmountAndFood e, Emitter<FoodInputState> emit) async {
  //   // when result is fetched:
  //   //      foodItem is in safeFoodItems ==> remove foodItem and add it to open collection of foodDataRepository such that it is synced with firestore
  //   //      foodItem is volatileFoodItems ==> update it in volatileFoodItems, not move to firestore yet.
  //   //  	  foodItem does not exist anymore ==> nothing happens

  //   final foodItem = e.foodItem;
  //   final result =
  //       await foodAnalysisRepository.fetchAmountAndFood(foodItem.string);

  //   bool foodItemInsafeFoodItems =
  //       state.safeFoodItems.any((fi) => fi.uniqueId == foodItem.uniqueId);
  //   if (foodItemInsafeFoodItems) {
  //     await foodDataRepository.addItem(foodItem.copyWith(value: some(result)));
  //     final newSafeFoodItems =
  //         state.safeFoodItems.filter((fi) => fi.uniqueId != foodItem.uniqueId);
  //     emit(state.copyWith(safeFoodItems: newSafeFoodItems));
  //   } else {
  //     final newVolatileFoodItems = state.volatileFoodItems.map((fi) =>
  //         fi.uniqueId == foodItem.uniqueId
  //             ? fi.copyWith(value: some(result))
  //             : fi);
  //     emit(state.copyWith(volatileFoodItems: newVolatileFoodItems));
  //   }
  // }
}
