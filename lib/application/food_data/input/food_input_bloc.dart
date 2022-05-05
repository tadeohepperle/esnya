import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/user_data/food_item_entry_bucket_repository.dart';
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
@lazySingleton
class FoodInputBloc extends Bloc<FoodInputEvent, FoodInputState> {
  final TextProcessingRepository _textProcessingRepository;
  final FoodMappingRepository _foodMappingRepository;
  final FoodItemEntryBucketRepository _foodItemEntryBucketRepository;

  List<Tuple2<Tuple2<IntRange, FoodItemString>, FoodItemEntry>>
      _fragmentsAndEntries; // not part of state because no need to expose

  final StreamController<BlocAndRepoFoodItemEntries> _entriesStreamController =
      StreamController<BlocAndRepoFoodItemEntries>.broadcast();
  Stream<BlocAndRepoFoodItemEntries> watchEntries() =>
      _entriesStreamController.stream;

  FoodInputBloc(this._textProcessingRepository,
      this._foodItemEntryBucketRepository, this._foodMappingRepository)
      : _fragmentsAndEntries = [],
        super(FoodInputState.initial()) {
    _entriesStreamController.onListen = () {
      _entriesStreamController
          .add(BlocAndRepoFoodItemEntries(blocEntries: _entries));
    };
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
          await _fetchFood(emit, fetchFood.entry);
        },
      );
    });
  }

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
    final List<FoodItemEntry> entriesToFetchFoodFor = [];
    // step 1: old can max be as long as new:
    if (oldList.length > newList.length) {
      oldList = oldList.sublist(0, newList.length);
    }
    // step 2: update all elements in old where foodItemString is not the same anymore.
    for (var i = 0; i < oldList.length; i++) {
      if (oldList[i].value1 != newList[i].value1) {
        oldList[i] = newList[i];
        entriesToFetchFoodFor.add(newList[i].value2);
      }
    }
    // step 3: add any items newList has more than oldList to oldList
    for (var i = oldList.length; i < newList.length; i++) {
      oldList.add(newList[i]);
      entriesToFetchFoodFor.add(newList[i].value2);
    }
    _fragmentsAndEntries = oldList;
    _entriesStreamController
        .add(BlocAndRepoFoodItemEntries(blocEntries: _entries));
    // fetch food for entries:
    for (var e in entriesToFetchFoodFor) {
      add(_FetchFood(e));
    }
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
    final updatedSafeText = state.safeText.substring(lastSafeRangeEnd);
    // alter bloc state:
    _fragmentsAndEntries = blocEntries;
    _entriesStreamController.add(BlocAndRepoFoodItemEntries(
      blocEntries: _entries,
      betweenBlocAndRepoEntries: repoEntries,
      // the repoEntries will be stored in dashboard_bloc until the repoEntries from the repository (firebase) arrive in dashboard_bloc
    ));
    emit(state.copyWith(
      safeText: updatedSafeText,
    ));
    // send to repo:
    _foodItemEntryBucketRepository.createEntriesForToday(repoEntries);
  }

  Future<void> _fetchFood(
      Emitter<FoodInputState> emit, FoodItemEntry entry) async {
    final resultOrFailure = await _foodMappingRepository.mapInput(entry.title);
    print(resultOrFailure);

    /// cases to consider:
    /// entry is in bloc vs. in repository  => same behavior
    /// entry is preSuccess vs entry is Success (fetching already yielded result in past).
    /// foodMappingResult is Failure vs. is Success and Food found vs. is Success But no Mapping found
    ///
    /// no matter if entry in bloc or repository, call updateEntry() which does the following:
    ///      is Failure: do nothing
    ///      is Success and FoodMappingResult==preSuccess --> should never happen, do nothing
    ///      is Success and Food found: override last entry --> FoodItemEntrySuccess
    ///              last entry was success: --> override food
    ///              last entry was preSuccess: --> call toSuccess(foodMappingResult)
    ///      is Success But no Match Found:
    ///              if entry is preSuccess: override last entry --> FoodItemEntryPreSuccess (with failed = true)
    ///              if entry already is success: no nothing, keep the old result, where a match was found.

    FoodItemEntry updateEntry(FoodItemEntry entry) {
      print("update entry");
      return resultOrFailure.fold(
        (failure) {
          if (failure is FoodMappingFailureNoMatchFound) {
            return entry.toMappingFailed();
          }
          return entry;
        },
        (foodMappingResult) => entry.map(
          semanticSuccess: (semanticSuccess) =>
              semanticSuccess.toSuccess(foodMappingResult),
          success: (entrySuccess) => entrySuccess.copyWith(
            foodItem:
                FoodItem(entrySuccess.foodItem.amount, foodMappingResult.food),
          ),
        ),
      );
    }

    // 1. assume entry is in bloc, so try to update in bloc:
    bool updatedinBloc = false;
    _fragmentsAndEntries = _fragmentsAndEntries.map((e) {
      if (e.value2.id == entry.id) {
        updatedinBloc = true;
        return Tuple2(e.value1, updateEntry(e.value2));
      } else {
        return e;
      }
    }).toList();
    if (updatedinBloc) {
      _entriesStreamController
          .add(BlocAndRepoFoodItemEntries(blocEntries: _entries));
    } else {
      // 2. assume entry is alread saved in repo, so update in repo:
      _foodItemEntryBucketRepository.updateEntryFunctionalForToday(
          entry.id, updateEntry);
    }
  }

  List<FoodItemEntry> get _entries =>
      _fragmentsAndEntries.map((e) => e.value2).toList();
}

class BlocAndRepoFoodItemEntries {
  /// entries that have been sent to the repo. They could already have been persisted
  /// there or the persisting takes some time.
  /// This is the reason we send them over for example to the dashboard_bloc,
  /// such that the user, does not get some milliseconds where the repoEntries
  /// have already left the foodInputBloc but have still not arrived in firestore completely.
  final List<FoodItemEntry> betweenBlocAndRepoEntries;
  // entries that are remaining in the bloc because their text in volatile and could change.K
  final List<FoodItemEntry> blocEntries;

  BlocAndRepoFoodItemEntries({
    required this.blocEntries,
    this.betweenBlocAndRepoEntries = const [],
  });
}
