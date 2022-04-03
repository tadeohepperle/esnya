import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/user_data/food_entries_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:esnya_shared_resources/text_processing/models/food_item_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'food_input_event.dart';
part 'food_input_state.dart';
part 'food_input_bloc.freezed.dart';

@isolate1
@injectable
class FoodInputBloc extends Bloc<FoodInputEvent, FoodInputState> {
  TextProcessingRepository _textProcessingRepository;
  FoodMappingRepository _foodMappingRepository;
  FoodEntriesRepository _foodEntriesRepository;

  FoodInputBloc(this._textProcessingRepository, this._foodEntriesRepository,
      this._foodMappingRepository)
      : _fragmentsAndEntries = [],
        super(FoodInputState.initial()) {
    on<FoodInputEvent>((event, emit) async {
      await event.map(
        setVolatileText: (setVolatileText) async {
          emit(state.copyWith(volatileText: setVolatileText.value));
          await _recalculateFragmentsAndEntries(emit);
        },
        saveVolatileText: (saveVolatileText) async {
          emit(state.copyWith(safeText: state.totalText, volatileText: ''));
          await _sendSafeEntriesToFoodEntriesRepository(emit);
        },
        fetchFood: (fetchFood) async {
          print("fetch food for ${fetchFood.entry.title}");
        },
      );
    });
  }

  List<Tuple2<Tuple2<IntRange, FoodItemString>, FoodItemEntry>>
      _fragmentsAndEntries; // not part of state because no need to expose

  Future<void> _recalculateFragmentsAndEntries(
      Emitter<FoodInputState> emit) async {
    FragmentizationResult result =
        await _textProcessingRepository.fragmentize(state.totalText);
    final newList = result.fragments
        .map((fragment) =>
            Tuple2(fragment, FoodItemEntry.fromFoodItemString(fragment.value2)))
        .toList();
    var oldList = [..._fragmentsAndEntries];
    // now combine the old _fragmentsAndEntries with the new fragmentsAndEntries: When we already have a fetched food for an entry from the past that is the same we clearly do not want to change it to a simple presuccess again:
    // step 1: old can max be as long as new:
    if (oldList.length > newList.length) {
      oldList = oldList.sublist(0, newList.length);
    }
    // step 2: update all elements in old where foodItemString is not the same anymore.
    for (var i = 0; i < newList.length; i++) {
      if (oldList[i].value1 != newList[i].value1) {
        oldList[i] = newList[i];
      }
    }
    // step 3: add any items newList has more than oldList to oldList
    for (var i = oldList.length; i < newList.length; i++) {
      oldList.add(newList[i]);
    }
    _fragmentsAndEntries = oldList;
    emit(state.copyWith(entries: _entries));
    await _sendSafeEntriesToFoodEntriesRepository(emit);
  }

  Future<void> _sendSafeEntriesToFoodEntriesRepository(
      Emitter<FoodInputState> emit) async {
    final safeLength = state.safeText.length;
    final sendToRepoMask =
        List.generate(_fragmentsAndEntries.length, (index) => false);
    int lastSafeRangeEnd = 0;
    // filter for safe and volatile entries:
    for (var i = 0; i < _fragmentsAndEntries.length; i++) {
      final range = _fragmentsAndEntries[i].value1.value1;
      if (range.end <= safeLength) {
        sendToRepoMask[i] = true;
        lastSafeRangeEnd = range.end;
      } else {
        break;
      }
    }
    // create new lists:
    final repoEntries = _entries
        .asMap()
        .entries
        .where((e) => sendToRepoMask[e.key])
        .map((e) => e.value)
        .toList();
    final blocEntries = _fragmentsAndEntries
        .asMap()
        .entries
        .where((e) => !sendToRepoMask[e.key])
        .map((e) => e.value)
        .map(
      (e) {
        final newRange = e.value1.value1 - lastSafeRangeEnd;
        return Tuple2(Tuple2(newRange, e.value1.value2), e.value2);
      },
    ).toList();
    final updatedSafeText = state.safeText.substring(0, lastSafeRangeEnd);
    // alter bloc state:
    _fragmentsAndEntries = blocEntries;
    emit(state.copyWith(
      entries: _entries,
      safeText: updatedSafeText,
    ));
    // send to repo:
    _foodEntriesRepository.addAll(repoEntries);
  }

  List<FoodItemEntry> get _entries =>
      _fragmentsAndEntries.map((e) => e.value2).toList();
}
