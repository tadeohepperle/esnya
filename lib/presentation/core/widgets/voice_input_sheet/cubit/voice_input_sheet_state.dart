part of 'voice_input_sheet_cubit.dart';

@freezed
class VoiceInputSheetState with _$VoiceInputSheetState {
  const factory VoiceInputSheetState.initial() = _Initial;

  const factory VoiceInputSheetState.error(String errorText) = _Error;

  const factory VoiceInputSheetState.recording(String currentInput) =
      _Recording;
  const factory VoiceInputSheetState.idle() = _Idle;

  const factory VoiceInputSheetState.preparing(double progress) = _Preparing;
}
