import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/user_data/food_entries_repository.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'food_entries_watcher_event.dart';
part 'food_entries_watcher_state.dart';
part 'food_entries_watcher_bloc.freezed.dart';

@isolate1
@injectable
class FoodEntriesWatcherBloc
    extends Bloc<FoodEntriesWatcherEvent, FoodEntriesWatcherState> {
  final FoodEntriesRepository _foodEntriesRepository;

  StreamSubscription<Either<Failure, List<FoodItemEntry>>>?
      _foodEntriesStreamSubscription;

  FoodEntriesWatcherBloc(this._foodEntriesRepository)
      : super(FoodEntriesWatcherState.initial()) {
    on<FoodEntriesWatcherEvent>((event, emit) async {
      await event.map(watchStarted: (_Started watchStarted) async {
        print("watch started");
        emit(FoodEntriesWatcherState.loadInProgress());
        await _foodEntriesStreamSubscription?.cancel();
        _foodEntriesStreamSubscription =
            _foodEntriesRepository.watchAll().listen((failureOrEntries) {
          print("get a new event");
          add(FoodEntriesWatcherEvent.entriesReceived(failureOrEntries));
        });
      }, entriesReceived: (_EntriesReceived entriesReceived) {
        emit(
          entriesReceived.failureOrFoodEntries.fold(
            (l) => FoodEntriesWatcherState.loadFailure(l),
            (r) => FoodEntriesWatcherState.loadSuccess(r),
          ),
        );
      });
    });
    add(FoodEntriesWatcherEvent.watchStarted());
  }

  @override
  Future<void> close() async {
    await _foodEntriesStreamSubscription?.cancel();
    return super.close();
  }
}
