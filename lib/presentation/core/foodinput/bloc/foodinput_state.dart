part of 'foodinput_bloc.dart';

@freezed
class FoodinputState with _$FoodinputState {
  const factory FoodinputState({
    required String safeTextClosed,
    required String safeTextOpen,
    required String volatileText,
    required KtList safeFoodItems,
    required KtList volatileFoodItems,
  }) = _FoodinputState;
  factory FoodinputState.initial() => const FoodinputState(
        safeTextClosed: '',
        safeTextOpen: '',
        volatileText: '',
        safeFoodItems: KtList.empty(),
        volatileFoodItems: KtList.empty(),
      );
}
