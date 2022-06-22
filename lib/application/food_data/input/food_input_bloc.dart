import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/data_structures/streamable_value.dart';
import 'package:esnya_shared_resources/core/data_structures/value_and_stream.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:esnya_shared_resources/text_processing/models/food_item_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:loggy/loggy.dart';

import 'models/food_item_entry_wrapper.dart';

part 'food_input_event.dart';
part 'food_input_state.dart';
part 'food_input_bloc.freezed.dart';

typedef FragmentAndEntry
    = Tuple2<Tuple2<IntRange, FoodItemString>, FoodItemEntryWrapper>;

/// a global singleton bloc, abstracting the way food input works (voice and text)
@isolate1
@lazySingleton
class FoodInputBloc extends Bloc<FoodInputEvent, FoodInputState> {
  ////// Public Interface:

  /// entries that are committed, practically leaving the bloc.
  /// Other Blocs can pickup this stream to listen to the outgoing entries leaving the bloc
  Stream<KtList<FoodItemEntry>> get outgoingEntries => _outgoingEntries.stream;

  ValueAndStream<KtList<FoodItemEntryWrapper>> get blocEntries =>
      _blocEntries.valueAndStream;

  ////// Private Values:
  final TextProcessingRepository _textProcessingRepository;
  final FoodMappingRepository _foodMappingRepository;

  final StreamableValue<KtList<FoodItemEntryWrapper>> _blocEntries =
      StreamableValue<KtList<FoodItemEntryWrapper>>(
          <FoodItemEntryWrapper>[].toImmutableList());

  KtList<FragmentAndEntry> ___fragmentsAndEntries = <FragmentAndEntry>[]
      .toImmutableList(); // not part of state because no need to expose

  KtList<FragmentAndEntry> get _fragmentsAndEntries => ___fragmentsAndEntries;
  set _fragmentsAndEntries(KtList<FragmentAndEntry> val) {
    ___fragmentsAndEntries = val;
    _blocEntries.value = ___fragmentsAndEntries.map((e) => e.value2);
  }

  final StreamController<KtList<FoodItemEntry>> _outgoingEntries =
      StreamController<KtList<FoodItemEntry>>.broadcast();

  FoodInputBloc(this._textProcessingRepository, this._foodMappingRepository)
      : super(FoodInputState.initial()) {
    on<FoodInputEvent>((event, emit) async {
      await event.map(
        setVolatileText: (_SetVolatileText setVolatileText) async {
          emit(state.copyWith(volatileText: setVolatileText.value));
          await _recalculateFragmentsAndEntries(emit);
        },
        saveVolatileText: (_SaveVolatileText saveVolatileText) async {
          await _makeTextSafeAndSaveEntriesToFoodEntriesRepository(emit);
        },
        fetchFood: (_FetchFood fetchFood) async {
          logDebug(
              "fetch food for ${fetchFood.entry.runtimeType} for input: ${fetchFood.entry.inputString}");
          await _fetchFood(emit, fetchFood.entry);
        },
        setContext: (_SetContext setContext) {
          /// reset bloc if the contextId does not match
          if (state.contextId != setContext.contextId) {
            emit(FoodInputState.initial());
          }
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
            Tuple2(fragment, fragment.value2.toFoodItemEntryProcessing()))
        .toList();
    var oldList = [..._fragmentsAndEntries.iter]; // copy list
    /// combine the two lists:
    final List<FoodItemEntryWrapper> entriesToFetchFoodFor = [];
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
    _fragmentsAndEntries = oldList.toImmutableList();
    // fetch food for entries:
    for (var e in entriesToFetchFoodFor) {
      add(_FetchFood(e));
    }
  }

  /// entries that are successfully mapped to a food are sent to the repository to be stored in firebase. Unsuccessful maps or items still being processed are not saved but omitted, once app is closed.
  Future<void> _makeTextSafeAndSaveEntriesToFoodEntriesRepository(
      Emitter<FoodInputState> emit) async {
    emit(state.copyWith(safeText: state.totalText, volatileText: ''));

    final sendToRepoMask =
        _fragmentsAndEntries.map((e) => e.value2 is FoodItemEntrySuccess);

    // create new lists:
    final outgoingEntries = _blocEntries.value
        .asList()
        .asMap()
        .entries
        .where((e) => sendToRepoMask[e.key])
        .map((e) => (e.value as FoodItemEntrySuccess).entry);

    List<Tuple2<Tuple2<IntRange, FoodItemString>, FoodItemEntryWrapper>>
        blocFragmentsAndEntries = [];
    // update blocentries and safetext
    int rangeStart = 0;
    String newSafeText = "";
    for (var i = 0; i < _fragmentsAndEntries.size; i++) {
      final e = _fragmentsAndEntries[i];
      if (!sendToRepoMask[i]) {
        final textForSegment = e.value1.value2.text;
        final newRange = IntRange(rangeStart, textForSegment.length);
        newSafeText += '$textForSegment, ';
        rangeStart += textForSegment.length + 2;
        blocFragmentsAndEntries
            .add(Tuple2(Tuple2(newRange, e.value1.value2), e.value2));
      }
    }

    // update fragmentsAndEntries and safetext in bloc.
    emit(state.copyWith(
      safeText: newSafeText,
    ));
    _fragmentsAndEntries = blocFragmentsAndEntries.toImmutableList();

    // expose via broadcast stream
    _outgoingEntries.add(outgoingEntries.toImmutableList());
  }

  Future<void> _fetchFood(
      Emitter<FoodInputState> emit, FoodItemEntryWrapper entry) async {
    final resultOrFailure =
        await _foodMappingRepository.mapInput(entry.inputString);
    logDebug('_fetchFood for ${entry.inputString} yielded $resultOrFailure ');

    _fragmentsAndEntries = _fragmentsAndEntries.map((e) {
      final oldEntryWrapper = e.value2;
      if (oldEntryWrapper.id != entry.id) {
        return e;
      } else {
        final newEntryWrapper = resultOrFailure.fold(
          (l) => oldEntryWrapper.toFailed(),
          (r) => oldEntryWrapper.toSuccess(r),
        );
        return Tuple2(e.value1, newEntryWrapper);
      }
    });
  }
}
