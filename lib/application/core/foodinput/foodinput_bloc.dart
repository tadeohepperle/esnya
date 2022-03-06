import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'foodinput_event.dart';
part 'foodinput_state.dart';
part 'foodinput_bloc.freezed.dart';

class FoodinputBloc extends Bloc<FoodinputEvent, FoodinputState> {
  FoodinputBloc() : super(FoodinputState.initial()) {
    on<FoodinputEvent>((event, emit) {
      event.map(reset: (e) {
        emit(FoodinputState.initial());
      }, setVolatileText: (e) {
        emit(state.copyWith(volatileText: e.text));
        // run tripletrecognition on (safeTextOpen + volatileText)
      }, makeVolatileTextSafe: (e) {
        emit(state.copyWith(
            safeTextOpen: state.safeTextOpen + state.volatileText,
            volatileText: ''));
        // run tripletrecognition on (safeTextOpen + volatileText)

        // write bloctest
      });
    });
  }
}
