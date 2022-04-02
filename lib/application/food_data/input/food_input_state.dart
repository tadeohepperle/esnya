part of 'food_input_bloc.dart';

@freezed
class FoodInputState with _$FoodInputState {
  const FoodInputState._();
  const factory FoodInputState({
    required String safeTextClosed,
    required String safeTextOpen,
    required String volatileText,
    required KtList<FoodItemEntry> volatileFoodItemEntries,
  }) = _FoodInputState;
  factory FoodInputState.initial() => const FoodInputState(
        safeTextClosed: '',
        safeTextOpen: '',
        volatileText: '',
        volatileFoodItemEntries: KtList.empty(),
      );
  String get safeTextOpenAndVolatileText =>
      safeTextOpen + ' ' + volatileText; // TODO: is space necessary?
  // EXPLANATION OF STATE:
  // text = safeTextClosed + safeTextOpen + volatileText
  // safeFoodItems and volatileFoodItem map to different ranges on this text, where safeFoodItems are fully covered by the safeTextClosed.
}
