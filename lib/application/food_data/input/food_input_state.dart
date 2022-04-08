part of 'food_input_bloc.dart';

@freezed
class FoodInputState with _$FoodInputState {
  const FoodInputState._();
  const factory FoodInputState({
    required String safeText,
    required String volatileText,
    required List<FoodItemEntry> entries,
  }) = _FoodInputState;
  factory FoodInputState.initial() =>
      FoodInputState(safeText: '', volatileText: '', entries: []);

  String get totalText => safeText + ' ' + volatileText;
}
