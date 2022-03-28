part of 'foodinput_bloc.dart';

@freezed
class FoodinputState with _$FoodinputState {
  const FoodinputState._();
  const factory FoodinputState({
    required String safeTextClosed,
    required String safeTextOpen,
    required String volatileText,
    required KtList<FoodItemEntry> safeFoodItemEntries,
    required KtList<FoodItemEntry> volatileFoodItemEntries,
  }) = _FoodinputState;
  factory FoodinputState.initial() => const FoodinputState(
        safeTextClosed: '',
        safeTextOpen: '',
        volatileText: '',
        safeFoodItemEntries: KtList.empty(),
        volatileFoodItemEntries: KtList.empty(),
      );
  String get safeTextOpenAndVolatileText =>
      safeTextOpen + ' ' + volatileText; // TODO: is space necessary?
  // EXPLANATION OF STATE:
  // text = safeTextClosed + safeTextOpen + volatileText
  // safeFoodItems and volatileFoodItem map to different ranges on this text, where safeFoodItems are fully covered by the safeTextClosed.
}
