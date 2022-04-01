import 'package:bloc/bloc.dart';
import 'package:esnya/injection_environments.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'food_entries_event.dart';
part 'food_entries_state.dart';
part 'food_entries_bloc.freezed.dart';

@isolate1
@injectable
class FoodEntriesBloc extends Bloc<FoodEntriesEvent, FoodEntriesState> {
  FoodEntriesBloc() : super(FoodEntriesState.initial()) {
    on<FoodEntriesEvent>((event, emit) {
      event.map(
          addEntry: (AddEntry event) {
            print("add entry");
            final newEntries = state.entries + [event.entry];
            emit(state.copyWith(entries: newEntries));
          },
          updateEntry: (UpdateEntry event) {
            final newEntries = state.entries
                .map((e) => e.id == event.entry.id ? event.entry : e);
            emit(state.copyWith(entries: newEntries.toList()));
          },
          initial: (InitialEvent event) {});
    });
    add(InitialEvent());
  }
}
