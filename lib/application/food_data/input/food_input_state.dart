part of 'food_input_bloc.dart';

@freezed
class FoodInputState with _$FoodInputState {
  const FoodInputState._();
  const factory FoodInputState({
    required String safeText,
    required String volatileText,
  }) = _FoodInputState;
  factory FoodInputState.initial() =>
      const FoodInputState(safeText: '', volatileText: '');

  String get totalText => safeText + ' ' + volatileText;
}
