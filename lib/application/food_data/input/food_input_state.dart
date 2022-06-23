part of 'food_input_bloc.dart';

@freezed
class FoodInputState with _$FoodInputState {
  const FoodInputState._();
  const factory FoodInputState({
    required String safeText,
    required String volatileText,
    required FoodInputMode foodInputMode,
    String? contextId,
  }) = _FoodInputState;
  factory FoodInputState.initial({String? contextId}) => FoodInputState(
        safeText: '',
        volatileText: '',
        foodInputMode: FoodInputMode.none,
        contextId: contextId,
      );

  String get totalText => safeText + ' ' + volatileText;
}

enum FoodInputMode { none, voice, text }
