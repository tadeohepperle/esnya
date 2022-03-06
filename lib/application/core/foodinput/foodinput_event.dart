part of 'foodinput_bloc.dart';

@freezed
class FoodinputEvent with _$FoodinputEvent {
  const factory FoodinputEvent.reset() = Reset;
  const factory FoodinputEvent.setVolatileText(String text) = SetVolatileText;
  const factory FoodinputEvent.makeVolatileTextSafe() = MakeVolatileTextSafe;
}
